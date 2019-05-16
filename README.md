# Docker with GDAL3 and OpenJPEG

Docker image with

 - GDAL 3.0.0
 - PROJ4 6.1.0
 - OpenJPEG 2.3.1
 
based on Ubuntu 

 - 18.04 Bionic Beaver with Python 3.6 and G++-7
 - 19.04 Disco Dingo with Python 3.7 and G++-8 

## Install
Execute the following statement on a linux based computer 

`chmod u+x $USER ./docker-build.sh`

and run afterwards with

`./docker-build.sh`

Grab a coffee and wait for several minutes (probably half an hour or up to an hour - which can vary depending on your available hardware). 

Done.

## Issues

I got several warnings with the latest Ubuntu 19.04 Disco Dingo caused by changes in Python 3.7 during the compilation process.

## Usage
Run docker container with

`docker run -it --rm gdal3:bionic`

or

`docker run -it --rm gdal3:disco`

and do whatever you like or add ENTRYPOINTS ans scripts.

## Credits
Credits to [Geographica](https://github.com/GeographicaGS), [Open Source Geospatial Foundation](https://github.com/OSGeo), [OpenJPEG](https://github.com/uclouvain/openjpeg) and [javimarlop](https://github.com/javimarlop).
