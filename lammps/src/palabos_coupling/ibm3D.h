#ifndef IBM_LBM_3D_H
#define IBM_LBM_3D_H

#include "lammpsWrapper.h"
#include "physunits.h"

namespace plb {
  
  template<typename T, template<typename U> class Descriptor>
  void forceCoupling3D(MultiBlockLattice3D<T,Descriptor> &lattice,
                           LammpsWrapper &wrapper, PhysUnits3D<T> const &units);
  
}; /* namespace plb */

#include "ibm3D.hh"

#endif 
