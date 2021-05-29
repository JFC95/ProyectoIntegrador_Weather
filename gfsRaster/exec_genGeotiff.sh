#!/bin/bash

file="/opt/wrfdatos/GFS025/2020_06/*/*.grib2"
for i in $file; do
    time python genGeotiff.py --path $i
done
