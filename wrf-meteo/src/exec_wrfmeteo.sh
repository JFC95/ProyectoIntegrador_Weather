#!/bin/bash
WRFOUT="/opt/wrfdatos/wrfout/2020_1*/wrfout_A_*"
OUTDIR_PRODUCTOS="/opt/datos/wrf-meteo"
OUTDIR_TABLA="temp/"

ray start --head --port=6380 --num-cpus=4

for i in $WRFOUT; do
    time python wrfmeteo.py $i ${OUTDIR_PRODUCTOS} ${OUTDIR_TABLA}
done

#time python wrfmeteo.py ${WRFOUT} ${OUTDIR_PRODUCTOS} ${OUTDIR_TABLA} 

#time python wrfzonas.py --path "../geotiff/2020_02/06/*" --target zonas --shapefile shapefiles/zonas.shp

#time python ingestor.py --path csv/WRF_${}_T2P_18.csv

ray stop