#!/bin/sh

head -n 3  mol.inp > charmm.inp
echo "bomlev -1" >> charmm.inp
tail -n +3 mol.inp >> charmm.inp
echo "write coor card name mol.crd" >> charmm.inp
echo "write psf card name mol.psf" >> charmm.inp
echo "stop" >> charmm.inp
