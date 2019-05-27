#!/bin/bash
echo "Building gdal Version 2 with Ubuntu 18.04 LTS Bionic"
docker build -t gdal2:bionic . --label "gdal"
