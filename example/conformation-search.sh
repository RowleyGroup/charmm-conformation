#!/bin/sh

obabel -:"O\([C@H]1[C@H]\(O\)[C@@H]\(O\)C\(O\)O[C@@H]1CO\)[C@H]2O[C@@H]\([C@@H]\(O\)[C@H]\(O\)[C@H]2O\)CO"  -h --gen3d -omol2 -Omol.mol2 
antechamber -fi mol2 -i mol.mol2 -fo charmm -o mol -c bcc

head -n 3  mol.inp > charmm.inp
./modcharmm.sh

charmm < charmm.inp > charmm.out

mpirun -np 20 charmm  < remd.inp > remd.out

