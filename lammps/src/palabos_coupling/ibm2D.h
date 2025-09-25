#ifndef IBM_LBM_2D_H
#define IBM_LBM_2D_H

#include "lammpsWrapper.h"
#include "physunits.h"
namespace plb {
						   
  template<typename T, template<typename U> class Descriptor>
  void forceCoupling2D(MultiBlockLattice2D<T,Descriptor> &lattice,
                           LammpsWrapper &wrapper, PhysUnits3D<T> const &units);
						   
  
}; /* namespace plb */

#include "ibm2D.hh"

#endif 
