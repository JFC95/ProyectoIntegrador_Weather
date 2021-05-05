#!/bin/bash
#WRFOUT="/opt/wrfdatos/wrfout/2020_05/wrfout_A_d01_2020-05-27_06:00:00"
WRFOUT="/opt/wrfdatos/wrfout/2021_05/wrfout_A_d01_2021-05-05_06:00:00.nc"

OUTDIR_PRODUCTOS="temp/productos"
OUTDIR_TABLA="temp/tablas/"
# La configuracion ahora es un parametro opcional, si no se pasa, se obtiene automaticamente del wrfout con el formato
# CBA_{PARAMETRIZACION}_{HORA}
#CONFIGURACION="CBA_A_06"

ray start --head --port=6379 --num-cpus=6

time python cuencas_wrf.py ${WRFOUT} ${OUTDIR_PRODUCTOS}  ${OUTDIR_TABLA} # --configuracion ${CONFIGURACION}

ray stop
