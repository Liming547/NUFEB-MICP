/* ----------------------------------------------------------------------
 LAMMPS - Large-scale Atomic/Molecular Massively Parallel Simulator
 http://lammps.sandia.gov, Sandia National Laboratories
 Steve Plimpton, sjplimp@sandia.gov

 Copyright (2003) Sandia Corporation.  Under the terms of Contract
 DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
 certain rights in this software.  This software is distributed under
 the GNU General Public License.

 See the README file in the top-level LAMMPS directory.
 ------------------------------------------------------------------------- */

#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "fix_eps_extract.h"
#include "atom.h"
#include "atom_vec.h"
#include "error.h"
#include "math_const.h"
#include "random_park.h"
#include "modify.h"
#include "update.h"
#include "domain.h"
#include "group.h"
#include "atom_masks.h"
#include "grid.h"
#include <iostream>
#include <cmath>
#include <vector>
#include <random>
#include "grid_masks.h"
using namespace LAMMPS_NS;
using namespace FixConst;
using namespace MathConst;

#define DELTA 1.005

/* ---------------------------------------------------------------------- */

FixEPSExtract::FixEPSExtract(LAMMPS *lmp, int narg, char **arg) :
  Fix(lmp, narg, arg)
{
  if (narg < 11)
    error->all(FLERR, "Illegal fix nufeb/eps_extract command");

  type = utils::inumeric(FLERR,arg[3],true,lmp);
  ieps = group->find(arg[4]);
  if (ieps < 0)
    error->all(FLERR, "Can't find group");
  ratio = utils::numeric(FLERR,arg[5],true,lmp);
  eps_density = utils::numeric(FLERR,arg[6],true,lmp);
  seed = utils::inumeric(FLERR,arg[7],true,lmp);

  
  // Random number generator, same for all procs
  random = new RanPark(lmp, seed);
  kcat = utils::numeric(FLERR,arg[8],true,lmp);
  km = utils::numeric(FLERR,arg[9],true,lmp);    // unit: mmol/L (urea)
  km = km/1000/0.1*6.006;  // unit: kg/m^3 (urea)
  icaco3 = group->find(arg[10]);
  force_reneighbor = 1;
}

/* ---------------------------------------------------------------------- */

FixEPSExtract::~FixEPSExtract()
{
  delete random;
}

/* ---------------------------------------------------------------------- */

int FixEPSExtract::setmask()
{
  int mask = 0;
  mask |= BIOLOGY_NUFEB;
  mask |= POST_NEIGHBOR;
  return mask;
}

/* ---------------------------------------------------------------------- */

int FixEPSExtract::modify_param(int narg, char **arg)
{
  int iarg = 0;
  while (iarg < narg) {
    if (strcmp(arg[iarg], "nevery") == 0) {
      nevery = utils::inumeric(FLERR,arg[iarg+1],false,lmp);
      if (nevery <= 0) error->all(FLERR,"Illegal fix_modify command");
      iarg += 2;
    } else {
      error->all(FLERR, "Illegal fix_modify command");
    }
  }
  return iarg;
}

/* ---------------------------------------------------------------------- */

void FixEPSExtract::biology_nufeb()
{
  if (update->ntimestep % nevery) return;
  compute();
  // trigger immediate reneighboring
  next_reneighbor = update->ntimestep;
}

/* ---------------------------------------------------------------------- */

void FixEPSExtract::post_neighbor()
{
  // reset reneighbor flag
  next_reneighbor = 0;
}

void FixEPSExtract::compute()
{
  int nlocal = atom->nlocal;
  int eps_mask = group->bitmask[ieps];
  int caco3_mask = group->bitmask[icaco3];

  int CaCO3seedcount = 1;

  std::vector<std::vector<int>> atomsInCells_Bacteria;
  std::vector<std::vector<int>> atomsInCells_CaCO3;
  std::vector<int> BacteriaVector;
  std::vector<int> CaCO3Vector;

  for (int i = 0; i < nlocal; i++) {
    if (atom->mask[i] & groupbit) {
      if ((atom->outer_radius[i] / atom->radius[i]) > ratio) {
        atom->outer_mass[i] = (4.0 * MY_PI / 3.0) *
            ((atom->outer_radius[i] * atom->outer_radius[i] * atom->outer_radius[i]) -
        	(atom->radius[i] * atom->radius[i] * atom->radius[i])) * eps_density;

        double split = 0.4 + (random->uniform() * 0.2);

        double new_outer_mass = atom->outer_mass[i] * split;
        double eps_mass = atom->outer_mass[i] - new_outer_mass;

        atom->outer_mass[i] = new_outer_mass;

        double density = atom->rmass[i] / (4.0 * MY_PI / 3.0 * atom->radius[i] * atom->radius[i] * atom->radius[i]);
        atom->outer_radius[i] = pow((3.0 / (4.0 * MY_PI)) * ((atom->rmass[i] / density) + (atom->outer_mass[i] / eps_density)), (1.0 / 3.0));

        double theta = random->uniform() * 2 * MY_PI;
        double phi = random->uniform() * (MY_PI);

        double oldx = atom->x[i][0];
        double oldy = atom->x[i][1];
        double oldz = atom->x[i][2];

        // create EPS atom
        double child_radius = pow(((6 * eps_mass) / (eps_density * MY_PI)), (1.0 / 3.0)) * 0.5;
        double *coord = new double[3];
        double newx = oldx - ((child_radius + atom->outer_radius[i]) * cos(theta) * sin(phi) * DELTA);
        double newy = oldy - ((child_radius + atom->outer_radius[i]) * sin(theta) * sin(phi) * DELTA);
        double newz = oldz - ((child_radius + atom->outer_radius[i]) * cos(phi) * DELTA);
        if (newx - child_radius < domain->boxlo[0]) {
          newx = domain->boxlo[0] + child_radius;
        } else if (newx + child_radius > domain->boxhi[0]) {
          newx = domain->boxhi[0] - child_radius;
        }
        if (newy - child_radius < domain->boxlo[1]) {
          newy = domain->boxlo[1] + child_radius;
        } else if (newy + child_radius > domain->boxhi[1]) {
          newy = domain->boxhi[1] - child_radius;
        }
        if (newz - child_radius < domain->boxlo[2]) {
          newz = domain->boxlo[2] + child_radius;
        } else if (newz + child_radius > domain->boxhi[2]) {
          newz = domain->boxhi[2] - child_radius;
        }
        coord[0] = newx;
        coord[1] = newy;
        coord[2] = newz;

        atom->avec->create_atom(type, coord);
        int n = atom->nlocal - 1;
        atom->tag[n] = 0;
        atom->mask[n] = 1 | eps_mask; 
        atom->v[n][0] = atom->v[i][0];
        atom->v[n][1] = atom->v[i][1];
        atom->v[n][2] = atom->v[i][2];
	      atom->f[n][0] = atom->f[i][0];
	      atom->f[n][1] = atom->f[i][1];
	      atom->f[n][2] = atom->f[i][2];
        atom->omega[n][0] = atom->omega[i][0];
        atom->omega[n][1] = atom->omega[i][1];
        atom->omega[n][2] = atom->omega[i][2];
	      atom->torque[n][0] = atom->torque[i][0];
	      atom->torque[n][1] = atom->torque[i][1];
	      atom->torque[n][2] = atom->torque[i][2];
        atom->rmass[n] = eps_mass;
        atom->biomass[n] = 1.0;
        atom->radius[n] = child_radius;
        atom->outer_mass[n] = 0;
        atom->outer_radius[n] = child_radius;

        //       modify->create_attribute(n);

        delete[] coord;
      }
    }


    if (atom->mask[i] == 3 ){ //  Bacteria cells produce new CaCO3 beads

      cell = grid ->cell(atom->x[i]);
      if (!(grid->mask[cell] & GHOST_MASK)){
        if (cell >= atomsInCells_Bacteria.size()) {
            atomsInCells_Bacteria.resize(cell + 1);
        }
        if (cell >= atomsInCells_CaCO3.size()) {
            atomsInCells_CaCO3.resize(cell + 1);
        }
        atomsInCells_Bacteria[cell].push_back(i);
      }
    } else if (atom->mask[i] == 9){ //  Old CaCO3 beads produce new CaCO3 beads
      
      cell = grid ->cell(atom->x[i]);

      if (!(grid->mask[cell] & GHOST_MASK)){
        if (cell >= atomsInCells_Bacteria.size()) {
            atomsInCells_Bacteria.resize(cell + 1);
        }
        if (cell >= atomsInCells_CaCO3.size()) {
            atomsInCells_CaCO3.resize(cell + 1);
        }
        atomsInCells_CaCO3[cell].push_back(i);
      }
    }

  }


  int maxNumCells = std::max(atomsInCells_Bacteria.size(), atomsInCells_CaCO3.size());
  for (int i = 0; i < maxNumCells; i++) {
    int BacteriaNum = atomsInCells_Bacteria[i].size();
    int oldCaCO3Num = atomsInCells_CaCO3[i].size();

    if (BacteriaNum > 0 || oldCaCO3Num > 0){
      double grid_volume = grid->cell_size*grid->cell_size*grid->cell_size;  // unit: m^3
      double grid_urea_mass = grid->conc[1][i] * grid_volume ;            // unit: kg
      double grid_Ca_mass   = grid->conc[2][i] * grid_volume ;            // unit: kg

      int constaints_from_urea = grid_urea_mass / 1.064217E-16;
      int constaints_from_Ca = grid_Ca_mass / 7.09478E-17;

      double V0 = kcat * ( grid->conc[0][i]/(1.428e-22)*grid_volume) * ( grid->conc[1][i]/ (km + grid->conc[1][i]) ) ;  // unit: s^(-1)
      V0 = V0*update->dt; // unit: dt^(-1)

      // Choose one
      int constaints_from_urease = V0 / 1062869748 ; // CaCO3 bead radius = 0.25 um

      int newCaCO3Num = std::min(constaints_from_urease, std::min( constaints_from_urea, constaints_from_Ca) );
 
      if (newCaCO3Num > 0){
        int fromBacteriaNum = std::round(newCaCO3Num*0.5*BacteriaNum/(0.5*BacteriaNum + (1-0.5)*oldCaCO3Num));
        int fromoldCaCO3Num = newCaCO3Num - fromBacteriaNum;

        BacteriaVector.resize(fromBacteriaNum);
        CaCO3Vector.resize(fromoldCaCO3Num);

        for (int p = 0; p < fromBacteriaNum; p++){
          double rv = random->uniform();
          int rvint = rv / (1.0/BacteriaNum);
          BacteriaVector[p] = rvint;
        }

        for (int p = 0; p < fromoldCaCO3Num; p++){
          double rv = random->uniform();
          int rvint = rv / (1.0/oldCaCO3Num);
          CaCO3Vector[p] = rvint;
        }


        double buffer_distance = 0;
        // Generate new CaCO3 beads
        for(int k : BacteriaVector) {

          int oldAtomID = atomsInCells_Bacteria[i][k];
          double oldx = atom->x[oldAtomID][0];
          double oldy = atom->x[oldAtomID][1];
          double oldz = atom->x[oldAtomID][2];
          // create CaCO3 atom
          double CaCO3_radius = 2.5e-7;
          double *coord = new double[3];
          double theta = random->uniform() * 2 * MY_PI;
          double phi = random->uniform() * (MY_PI);
          
          double newx = oldx - ((CaCO3_radius + atom->outer_radius[oldAtomID] + buffer_distance) * cos(theta) * sin(phi) * DELTA);
          double newy = oldy - ((CaCO3_radius + atom->outer_radius[oldAtomID] + buffer_distance) * sin(theta) * sin(phi) * DELTA);
          double newz = oldz - ((CaCO3_radius + atom->outer_radius[oldAtomID] + buffer_distance) * cos(phi) * DELTA);
          if (newx - CaCO3_radius < domain->boxlo[0]) {
            newx = domain->boxlo[0] + CaCO3_radius;
          } else if (newx + CaCO3_radius > domain->boxhi[0]) {
            newx = domain->boxhi[0] - CaCO3_radius;
          }
          if (newy - CaCO3_radius < domain->boxlo[1]) {
            newy = domain->boxlo[1] + CaCO3_radius;
          } else if (newy + CaCO3_radius > domain->boxhi[1]) {
            newy = domain->boxhi[1] - CaCO3_radius;
          }
          if (newz - CaCO3_radius < domain->boxlo[2]) {
            newz = domain->boxlo[2] + CaCO3_radius;
          } else if (newz + CaCO3_radius > domain->boxhi[2]) {
            newz = domain->boxhi[2] - CaCO3_radius;
          }
          coord[0] = newx;
          coord[1] = newy;
          coord[2] = newz;
          atom->avec->create_atom(3, coord);
          int n = atom->nlocal - 1;

          atom->tag[n] = 0;
          atom->mask[n] = 1 | caco3_mask; 
          atom->v[n][0] = 0;
          atom->v[n][1] = 0;
          atom->v[n][2] = 0;
	        atom->f[n][0] = 0;
	        atom->f[n][1] = 0;
	        atom->f[n][2] = 0;

          atom->omega[n][0] = 0;
          atom->omega[n][1] = 0;
          atom->omega[n][2] = 0;
	        atom->torque[n][0] = 0;
	        atom->torque[n][1] = 0;
	        atom->torque[n][2] = 0;
          atom->rmass[n] = 1.77e-16; 

          atom->biomass[n] = 0;
          atom->radius[n] = CaCO3_radius;
          atom->outer_mass[n] = 0;
          atom->outer_radius[n] = CaCO3_radius;
          delete[] coord;
	        // Update Ca and Urea concentration
          double grid_urea_mass = grid->conc[1][i] * grid_volume ;            // unit: kg
          double grid_Ca_mass   = grid->conc[2][i] * grid_volume ;            // unit: kg
	        grid->conc[1][i] = (grid_urea_mass - 1.064217e-16)  /  grid_volume ; 
	        grid->conc[2][i] = (grid_Ca_mass - 7.09478e-17)  /  grid_volume ;    

        }

        for(int k : CaCO3Vector) {
          int oldAtomID = atomsInCells_CaCO3[i][k];
          double oldx = atom->x[oldAtomID][0];
          double oldy = atom->x[oldAtomID][1];
          double oldz = atom->x[oldAtomID][2];
          // create CaCO3 atom
          double CaCO3_radius = 2.5e-7;
          double *coord = new double[3];
          double theta = random->uniform() * 2 * MY_PI;
          double phi = random->uniform() * (MY_PI);
          double newx = oldx - ((CaCO3_radius + atom->outer_radius[oldAtomID] + buffer_distance) * cos(theta) * sin(phi) * DELTA);
          double newy = oldy - ((CaCO3_radius + atom->outer_radius[oldAtomID] + buffer_distance) * sin(theta) * sin(phi) * DELTA);
          double newz = oldz - ((CaCO3_radius + atom->outer_radius[oldAtomID] + buffer_distance) * cos(phi) * DELTA);
          if (newx - CaCO3_radius < domain->boxlo[0]) {
            newx = domain->boxlo[0] + CaCO3_radius;
          } else if (newx + CaCO3_radius > domain->boxhi[0]) {
            newx = domain->boxhi[0] - CaCO3_radius;
          }
          if (newy - CaCO3_radius < domain->boxlo[1]) {
            newy = domain->boxlo[1] + CaCO3_radius;
          } else if (newy + CaCO3_radius > domain->boxhi[1]) {
            newy = domain->boxhi[1] - CaCO3_radius;
          }
          if (newz - CaCO3_radius < domain->boxlo[2]) {
            newz = domain->boxlo[2] + CaCO3_radius;
          } else if (newz + CaCO3_radius > domain->boxhi[2]) {
            newz = domain->boxhi[2] - CaCO3_radius;
          }
          coord[0] = newx;
          coord[1] = newy;
          coord[2] = newz;
          atom->avec->create_atom(3, coord);
          int n = atom->nlocal - 1;

          atom->tag[n] = 0;
          atom->mask[n] = 1 | caco3_mask; 
          atom->v[n][0] = 0;
          atom->v[n][1] = 0;
          atom->v[n][2] = 0;
	        atom->f[n][0] = 0;
	        atom->f[n][1] = 0;
	        atom->f[n][2] = 0;

          atom->omega[n][0] = 0;
          atom->omega[n][1] = 0;
          atom->omega[n][2] = 0;
	        atom->torque[n][0] = 0;
	        atom->torque[n][1] = 0;
	        atom->torque[n][2] = 0;
          atom->rmass[n] = 1.77e-16; 
          atom->biomass[n] = 0;
          atom->radius[n] = CaCO3_radius;
          atom->outer_mass[n] = 0;
          atom->outer_radius[n] = CaCO3_radius;
          delete[] coord;
	        // Update Ca and Urea concentration
          double grid_urea_mass = grid->conc[1][i] * grid_volume ;            // unit: kg
          double grid_Ca_mass   = grid->conc[2][i] * grid_volume ;            // unit: kg
	        grid->conc[1][i] = (grid_urea_mass - 1.064217e-16)  /  grid_volume ; 
	        grid->conc[2][i] = (grid_Ca_mass - 7.09478e-17)  /  grid_volume ;    

        }

        
      } 



    } 





  }



  atomsInCells_Bacteria.clear(); // Remove all elements
  atomsInCells_Bacteria.shrink_to_fit(); // Request to release memory
  atomsInCells_CaCO3.clear(); // Remove all elements
  atomsInCells_CaCO3.shrink_to_fit(); // Request to release memory
  BacteriaVector.clear();
  BacteriaVector.shrink_to_fit(); 
  CaCO3Vector.clear();
  CaCO3Vector.shrink_to_fit(); 


  bigint nblocal = atom->nlocal;
  MPI_Allreduce(&nblocal, &atom->natoms, 1, MPI_LMP_BIGINT, MPI_SUM, world);
  if (atom->natoms < 0 || atom->natoms >= MAXBIGINT)
    error->all(FLERR, "Too many total atoms");

  if (atom->tag_enable)
    atom->tag_extend();
  atom->tag_check();

  if (atom->map_style) {
    atom->nghost = 0;
    atom->map_init();
    atom->map_set();
  }
}
