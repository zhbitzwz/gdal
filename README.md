# Docker with GDAL 3 and OpenJPEG

GDAL 3.0.0 with PROJ4 6.0.0 and OpenJPEG 2.3.1 running with (currently) latest Ubuntu 19.04 Disco Dingo.

## Install
Under Linux make 

`chmod u+x $USER`

and run with

`./docker-build.sh`

Grab a coffee and wait for several minutes. Done.

## Usage
Run docker container with

` docker run -it --rm gdal:3.0.0`

and do whatever you like or add ENTRYPOINTS ans scripts.

## Credits
Credits to [Geographica](https://github.com/GeographicaGS), [Open Source Geospatial Foundation](https://github.com/OSGeo), [OpenJPEG](https://github.com/uclouvain/openjpeg) and [javimarlop](https://github.com/javimarlop).
