/*
 * This file is part of the OpenFSI package.
 *
 * OpenFSI is free package: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright 2022 Hao Jiang Syracuse University
 * Author: Hao Jiang (hjiang37@syr.edu)
 * Note: This file is written based on Jifu Tan(https://github.com/TJFord/palabos-lammps) and Huilin Ye (https://github.com/huilinye/OpenFSI).
 */

#ifndef IBM_LBM_3D_HH
#define IBM_LBM_3D_HH

#include "atom.h"
#include "modify.h"
#include "fix.h"
#include "fix_fcm.h"
#include "update.h"
#include <algorithm>
#include "fix_external.h"
#include "library.h"

namespace plb {
  
/*	template<typename T>
  void weight(T r, std::vector<T> & w){
      T q = sqrt(1 + 4*r*(1-r));
      w[0] = (3 - 2*r - q)/8.0;
      w[1] = (3 - 2*r + q)/8.0;
      w[2] = (1 + 2*r + q)/8.0;
      w[3] = (1 + 2*r - q)/8.0;
  } */
  
	template<typename T>
  void weight(T dx, std::vector<T> & w){
      T weightx = 0.0;
	  T rsq = 0.0;
	  T r = 0.0;
	  for(plint i=0; i<4; i++){
		rsq = (-dx-1+i)*(-dx-1+i);
		if(rsq>=4) {
			weightx=0.0;
		} else {
			r=sqrt(rsq);
			if(rsq>1){
				weightx=(5.0-2.0*r-sqrt(-7.0+12.0*r-4.0*rsq))/8.;
			} else {
				weightx=(3.0-2.0*r+sqrt(1.0+4.0*r-4.0*rsq))/8.;
			}
		}
	  w[i]=weightx;
	  }
  }
  
/*	template<typename T>
  void weight(T dx, std::vector<T> & w){
      T weightx = 0.0;
	  T rsq = 0.0;
	  T r = 0.0;
	  for(plint i=0; i<4; i++){
		rsq = (-dx-1+i)*(-dx-1+i);
		if(rsq>2.25) {
			weightx=0.0;
		} else {
			r=sqrt(rsq);
			if(rsq>0.25){
				weightx=(5.0-3.0*r-sqrt(-2.0+6*r-3.0*rsq))/6.;
			} else {
				weightx=(1.0+sqrt(1.0-3.0*rsq))/3.;
			}
		}
	  w[i]=weightx;
	  }
  }  */
  
  template<typename T>
  T phi2(T r){
	  r = fabs(r);
	  r = 1.0 - r; 
	  if (r>0.0) return r;
	  else return 0.0;
  }

//********************************
//force coupling
//********************************
  template<typename T, template<typename U> class Descriptor>
  class ForceFSI3D: public BoxProcessingFunctional3D_L<T,Descriptor>{
    public:
      ForceFSI3D(LammpsWrapper &wrapper_, PhysUnits3D<T> const &units_):wrapper(wrapper_),units(units_){
        plint i,ifix(0),nfix;
        nfix = wrapper.lmp->modify->nfix;
        for (i=0;i<nfix;i++)

          if (strcmp(wrapper.lmp->modify->fix[i]->style,"fcm")==0) ifix=i;
          
        f_fcm = dynamic_cast<LAMMPS_NS::FixFCM *>(wrapper.lmp->modify->fix[ifix]);
        f_fcm->grow_arrays(wrapper.lmp->atom->nmax);
        f_fcm->init();
        groupbit = f_fcm->groupbit;//new code
		dt = wrapper.lmp->update->dt;
      }
      virtual void process(Box3D domain, BlockLattice3D<T,Descriptor> &lattice){
        Dot3D offset = lattice.getLocation();
        //TensorField3D<T,Descriptor<T>::d> velocity(lattice.getNx(),lattice.getNy(),lattice.getNz());
        TensorField3D<T,Descriptor<T>::d> velocity(4,4,4);
        plint xl,yl,zl,ix,iy,iz,ii,jj,kk,ll;
        T x_lb,y_lb,z_lb,rx,ry,rz,wgt;
        T rho;
        Array<T,3> us(0.,0.,0.);
        Array<T,3> fsi(0.,0.,0.);
        Array<T,3> uf(0.,0.,0.);
		Array<T,3> fsii(0.,0.,0.);
        T **x = wrapper.lmp->atom->x;
        T **v = wrapper.lmp->atom->v;
		int *type = wrapper.lmp->atom->type;
		T *mass = wrapper.lmp->atom->mass;

        T **fe = f_fcm->fexternal;
        int *mask = wrapper.lmp->atom->mask;
		
		//T dtoverdtcollision = units.getdtoverdtcollision();
		T dtoverdtcollision = 1.;
		
        plint nlocal = wrapper.lmp->atom->nlocal;
        std::vector<T> wx(4,0.0),wy(4,0.0),wz(4,0.0);
        //for(ix=domain.x0-2;ix<=domain.x1+2;ix++)
       // for(iy=domain.y0-2;iy<=domain.y1+2;iy++)
        //for(iz=domain.z0-2;iz<=domain.z1+2;iz++){
        //  lattice.get(ix,iy,iz).computeVelocity(velocity.get(ix,iy,iz));
          //density(ix,iy,iz)=lattice.get(ix,iy,iz).computeDensity();
       // }
        for (plint iS=0; iS<nlocal; iS++){
          if (mask[iS] & groupbit ){
			x_lb = units.getLbPosition(x[iS][0]);
			y_lb = units.getLbPosition(x[iS][1]);
			z_lb = units.getLbPosition(x[iS][2]);
			
			xl = floor(x_lb); 
            yl = floor(y_lb); 
            zl = floor(z_lb);
            rx = x_lb - xl;
            ry = y_lb - yl;
            rz = z_lb - zl;
            weight<T>(rx,wx);
            weight<T>(ry,wy);
            weight<T>(rz,wz);
            us[0] = us[1] = us[2]=0.0;
            rho=0.0;
            for (ii=0;ii<4;ii++ )
              for (jj=0;jj<4;jj++ )
                for (kk=0;kk<4;kk++ ){
                  ix = xl-1 + ii - offset.x ;
                  iy = yl-1 + jj - offset.y ;
                  iz = zl-1 + kk - offset.z ;
			  			  
				  
				  if (ix > domain.x1 || ix < domain.x0-2) continue; 
                  if (iy > domain.y1 || iy < domain.y0-2) continue;
                  if (iz > domain.z1 || iz < domain.z0-2) continue;
                 
				  lattice.get(ix,iy,iz).computeVelocity(velocity.get(ii,jj,kk));
                  //uf = velocity.get(ix,iy,iz);
				  uf = velocity.get(ii,jj,kk);
                  wgt = wx[ii]*wy[jj]*wz[kk];
				  //std::cout<<"fluid velocity"<<uf[0]<<" "<<uf[1]<<" "<<uf[2]<<std::endl;
				  //std::cout<<"weight"<<wgt<<std::endl;
                  us[0] += wgt*uf[0];
                  us[1] += wgt*uf[1];
                  us[2] += wgt*uf[2];
                  rho += wgt*lattice.get(ix,iy,iz).computeDensity();
                }
            
			
			// Equation from lb/fluid in LAMMPS
			T massone = units.getLbMass(mass[type[iS]]);
			T volone = pow(massone/2.567368347,2/3) * 0.5;
			T gammavalue = 2.0*(massone*rho*volone)*dtoverdtcollision/(massone+rho*volone);
            fsi[0]=gammavalue*(us[0]-units.getLbVel(v[iS][0]));        
            fsi[1]=gammavalue*(us[1]-units.getLbVel(v[iS][1]));          
            fsi[2]=gammavalue*(us[2]-units.getLbVel(v[iS][2])); 
            
            fe[iS][0] = units.getPhysForce(fsi[0]); 
            fe[iS][1] = units.getPhysForce(fsi[1]);
            fe[iS][2] = units.getPhysForce(fsi[2]);
            
            // Equation from Eqn.(5) in K. Aidun. Int J. Numer. Meth. Fluids 2010:62:765-783 
			//fsi[0]=rho*(us[0]-units.getLbVel(v[iS][0]))*dtoverdtcollision;        
            //fsi[1]=rho*(us[1]-units.getLbVel(v[iS][1]))*dtoverdtcollision;
			//fsi[2]=rho*(us[2]-units.getLbVel(v[iS][2]))*dtoverdtcollision;
            //fe[iS][0] = units.getPhysForce(fsi[0]);
            //fe[iS][1] = units.getPhysForce(fsi[1]);
            //fe[iS][2] = units.getPhysForce(fsi[2]);
			
            
			//iterative algorithm from Eqn.(29)-(34) in Mohammadmehdi Ataei, Computational Mechanics, https://doi.org/10.1007/s00466-021-02136-9
			
			//T massone = mass[type[iS]];
			//T areaone = pow(massone/2.567368347,2/3);
			//fsi[0]=(units.getPhysVel(us[0])-v[iS][0])/dt;        
            //fsi[1]=(units.getPhysVel(us[1])-v[iS][1])/dt;
			//fsi[2]=(units.getPhysVel(us[2])-v[iS][2])/dt;

			/*T massone = units.getLbMass(mass[type[iS]]);
			T areaone = pow(massone/2.567368347,2/3);
			for (ll=0;ll<6;ll++){
				fsi[0]= fsi[0] + us[0]-units.getLbVel(v[iS][0]);        
				fsi[1]= fsi[1] + us[1]-units.getLbVel(v[iS][1]);          
				fsi[2]= fsi[2] + us[2]-units.getLbVel(v[iS][2]); 			
			
				us[0] = us[1] = us[2]=0.0;
				for (ii=0;ii<4;ii++ )
				  for (jj=0;jj<4;jj++ )
					for (kk=0;kk<4;kk++ ){
					ix = xl-1 + ii - offset.x ;
					iy = yl-1 + jj - offset.y ;
					iz = zl-1 + kk - offset.z ;
                 				  
					if (ix > domain.x1 || ix < domain.x0-2) continue; 
					if (iy > domain.y1 || iy < domain.y0-2) continue;
					if (iz > domain.z1 || iz < domain.z0-2) continue;
					wgt = wx[ii]*wy[jj]*wz[kk];
					fsii[0] = wgt*fsi[0]*areaone; 
					fsii[1] = wgt*fsi[1]*areaone; 
					fsii[2] = wgt*fsi[2]*areaone;
					velocity.get(ii,jj,kk) = velocity.get(ii,jj,kk) - fsii;
					uf = velocity.get(ii,jj,kk);
					us[0] += wgt*uf[0];
					us[1] += wgt*uf[1];
					us[2] += wgt*uf[2];
                }
			}
			
			fe[iS][0] = units.getPhysForce(fsi[0]);
			fe[iS][1] = units.getPhysForce(fsi[1]);
			fe[iS][2] = units.getPhysForce(fsi[2]);
			*/

			for (ii=0;ii<4;ii++ )
              for (jj=0;jj<4;jj++ )
                for (kk=0;kk<4;kk++ ){
                  ix = xl-1 + ii - offset.x ;
                  iy = yl-1 + jj - offset.y ;
                  iz = zl-1 + kk - offset.z ;
                 				  
				if (ix > domain.x1 || ix < domain.x0-2) continue; 
                if (iy > domain.y1 || iy < domain.y0-2) continue;
                if (iz > domain.z1 || iz < domain.z0-2) continue;
				  
                  Cell<T,Descriptor>& cell  = lattice.get(ix,iy,iz);
                  T *ff=cell.getExternal(Descriptor<T>::ExternalField::forceBeginsAt);
                  wgt = wx[ii]*wy[jj]*wz[kk];
                  ff[0] -= wgt*fsi[0]; 
                  ff[1] -= wgt*fsi[1]; 
                  ff[2] -= wgt*fsi[2]; 
                  cell.setExternalField(Descriptor<T>::ExternalField::forceBeginsAt,Descriptor<T>::ExternalField::sizeOfForce,ff );
                }
          }//mask[is]
        }
      }
      virtual ForceFSI3D<T,Descriptor> * clone() const{
        return new ForceFSI3D(*this);
      }
      void getTypeOfModification(std::vector<modif::ModifT> & modified) const {
        modified[0]=modif::staticVariables;
      }
      virtual BlockDomain::DomainT appliesTo() const{
        return BlockDomain::bulk;
      }
    private:
      LammpsWrapper &wrapper;
	  PhysUnits3D<T> const &units;
      class LAMMPS_NS::FixFCM *f_fcm;
      plint groupbit;
	  T dt;
  };


  template<typename T, template<typename U> class Descriptor>
  void forceCoupling3D(MultiBlockLattice3D<T,Descriptor> &lattice, LammpsWrapper &wrapper, PhysUnits3D<T> const &units)
  {
    //plint envelopeWidth = 2;
    //applyProcessingFunctional(new Interpolation3D<T>(wrapper), velocity.getBoundingBox(),velocity, envelopeWidth); 
    applyProcessingFunctional(new ForceFSI3D<T,Descriptor>(wrapper,units), lattice.getBoundingBox(),lattice); 
  }
//*********************************
// force coupling ends
//*********************************

}; /* namespace plb */

#endif 
