##
#
# This creates an Ubuntu derived base image that installs GDAL 3.
#
# Ubuntu 18.04 Bionic Beaver
FROM ubuntu:bionic

MAINTAINER Valentin <github@crait.de>

ARG DEBIAN_FRONTEND=noninteractive
ARG ROOTDIR=/usr/local/
ARG GDAL_VERSION=3.0.0
ARG OPENJPEG_VERSION=2.3.1
ARG PROJ_VERSION=6.0.0

# Load assets
WORKDIR $ROOTDIR/ 

# Prepare system
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y dist-upgrade && apt-get -y install apt-transport-https ca-certificates curl software-properties-common 

# Install basic dependencies
RUN apt-get update -y && apt-get install -y \
    build-essential \
    python-dev \
    python3-dev \
    python-numpy \
    python3-numpy \
    libspatialite-dev \
    sqlite3 \
    libpq-dev \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libgeos-dev \
    libnetcdf-dev \
    libpoppler-dev \
    libspatialite-dev \
    libhdf4-alt-dev \
    libhdf5-serial-dev \
    bash-completion \
    vim \
    g++ \
    cmake

# Add current GDAL, PROJ and OPENJPEG version from external website
ADD http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz $ROOTDIR/src/
ADD https://github.com/uclouvain/openjpeg/archive/v${OPENJPEG_VERSION}.tar.gz $ROOTDIR/src/openjpeg-${OPENJPEG_VERSION}.tar.gz
ADD http://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz $ROOTDIR/src/proj-${PROJ_VERSION}.tar.gz

# Add current GDAL, PROJ and OPENJPEG version from local disk
# COPY proj-${PROJ_VERSION}.tar.gz $ROOTDIR/src/proj-${PROJ_VERSION}.tar.gz
# COPY openjpeg-${OPENJPEG_VERSION}.tar.gz $ROOTDIR/src/openjpeg-${OPENJPEG_VERSION}.tar.gz
# COPY gdal-${GDAL_VERSION}.tar.gz $ROOTDIR/src/gdal-${GDAL_VERSION}.tar.gz

# Compile and install Proj4 v6
RUN cd src && tar -xvf proj-${PROJ_VERSION}.tar.gz && cd proj-${PROJ_VERSION}/ \
    && mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$ROOTDIR \
    && make && make install && ldconfig && make clean \
    && cd $ROOTDIR && rm -Rf src/proj* 

# Compile and install OpenJPEG
RUN cd src && tar -xvf openjpeg-${OPENJPEG_VERSION}.tar.gz && cd openjpeg-${OPENJPEG_VERSION}/ \
    && mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$ROOTDIR \
    && make && make install && make clean \
    && cd $ROOTDIR && rm -Rf src/openjpeg*

# Compile and install GDAL
RUN cd src && tar -xvf gdal-${GDAL_VERSION}.tar.gz && cd gdal-${GDAL_VERSION} \
    && ./configure --with-python --with-spatialite --with-pg --with-curl --with-openjpeg \
    && make -j $(nproc) && make install && ldconfig \
    && apt-get update -y \
    && cd $ROOTDIR && cd src/gdal-${GDAL_VERSION}/swig/python \
    && python3 setup.py build \
    && python3 setup.py install \
    && apt-get remove -y --purge build-essential python-dev python3-dev \
    && cd $ROOTDIR && rm -Rf src/gdal*
