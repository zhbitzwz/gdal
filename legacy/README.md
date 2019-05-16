# Docker with GDAL2 and OpenJPEG

Docker image with

 - GDAL 2.4.1
 - OpenJPEG 2.3.1
 
based on Ubuntu 

 - 18.04 Bionic Beaver with Python 3.6 and G++-7

## Install
Execute the following statement on a linux based computer 

`chmod u+x ./docker-build.sh`

and run afterwards with

`./docker-build.sh`

Grab a coffee and wait for several minutes (probably half an hour or up to an hour - which can vary depending on your available hardware). 

Done.

## Usage
Run docker container with

`docker run -it --rm gdal2:bionic`

and do whatever you like or add ENTRYPOINTS ans scripts.

## Credits
Credits to [Geographica](https://github.com/GeographicaGS), [Open Source Geospatial Foundation](https://github.com/OSGeo), [OpenJPEG](https://github.com/uclouvain/openjpeg) and [javimarlop](https://github.com/javimarlop).
