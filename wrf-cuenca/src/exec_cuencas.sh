#!/bin/bash

OUTDIR_PRODUCTOS="temp/productos"
OUTDIR_TABLA="temp/tablas/"
# La configuracion ahora es un parametro opcional, si no se pasa, se obtiene automaticamente del wrfout con el formato
# CBA_{PARAMETRIZACION}_{HORA}
CONFIGURACION6="CBA_A_06"
CONFIGURACION18="CBA_A_18"

DIA06="/opt/wrfdatos/wrfout/20*/wrfout_A_*_06*"
DIA18="/opt/wrfdatos/wrfout/20*/wrfout_A_*_18*"
ray start --head --port=6379 --num-cpus=6
for i in $DIA06; do
    time python cuencas_wrf.py $i ${OUTDIR_PRODUCTOS}  ${OUTDIR_TABLA} --configuracion ${CONFIGURACION6}
done
for j in $DIA18; do
    time python cuencas_wrf.py $j ${OUTDIR_PRODUCTOS}  ${OUTDIR_TABLA} --configuracion ${CONFIGURACION18}

done
ray stop 
