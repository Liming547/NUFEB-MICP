#  NUFEB-MICP

## Overview

This repository contains a modified version of NUFEB (Newcastle University Frontiers in Environmental Biology, https://github.com/nufeb/NUFEB-2), a high-performance simulator for individual-based modelling of microbial communities.


These changes extend NUFEB by:

- Implemented simulations of microbially induced calcite precipitation (MICP).
- Enabled enzyme secretion by bacteria within the simulation framework.
- Integrated Michaelis–Menten kinetics to model catalytic reactions.

---

## Installation
```bash
git clone https://github.com/Liming547/NUFEB-MICP.git
cd NUFEB-MICP
bash ./install.sh
```

---

## Usage
The example illustrates the bacterial growth and MICP process.

```bash
cd example
mpirun -np 8 ../nufeb_mpi -in micp.nufeb > log.txt
```


