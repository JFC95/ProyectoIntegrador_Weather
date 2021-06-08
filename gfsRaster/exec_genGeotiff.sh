#!/bin/bash

file="/opt/wrfdatos/GFS025/2020_*/*/*.grib2"
for i in $file; do
    time python genGeotiff.py --path $i
done
