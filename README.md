# Docker with GDAL 3 and OpenJPEG

Docker image with

 - GDAL 3.0.0
 - PROJ4 6.0.0
 - OpenJPEG 2.3.1
 
based on Ubuntu 

 - 18.04 Bionic Beaver with Python 3.6
 - 19.04 Disco Dingo with Python 3.7 

## Install
Execute the following statement on a linux based computer 

`chmod u+x $USER ./docker-build.sh`

and run afterwards with

`./docker-build.sh`

Grab a coffee and wait for several minutes. 

Done.

## Issues

I got several warnings with the latest Ubuntu 19.04 Disco Dingo caused by changes in Python 3.7.

## Usage
Run docker container with

`docker run -it --rm gdal3:bionic`

or

`docker run -it --rm gdal3:disco`

and do whatever you like or add ENTRYPOINTS ans scripts.

## Credits
Credits to [Geographica](https://github.com/GeographicaGS), [Open Source Geospatial Foundation](https://github.com/OSGeo), [OpenJPEG](https://github.com/uclouvain/openjpeg) and [javimarlop](https://github.com/javimarlop).
