##
#
# This creates an Ubuntu derived base image that installs GDAL2.
#
# Ubuntu 18.04 Bionic Beaver
FROM ubuntu:bionic

MAINTAINER Valentin <github@crait.de>

# Set temporary variables
ARG DEBIAN_FRONTEND=noninteractive
ARG ROOTDIR=/usr/local/
ARG GDAL_VERSION=2.4.1
ARG OPENJPEG_VERSION=2.3.1

# Load assets
WORKDIR $ROOTDIR/

# Add current GDAL and OPENJPEG version from external website
ADD http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz \ 
    $ROOTDIR/src/gdal-${GDAL_VERSION}.tar.gz
ADD https://github.com/uclouvain/openjpeg/archive/v${OPENJPEG_VERSION}.tar.gz \
    $ROOTDIR/src/openjpeg-${OPENJPEG_VERSION}.tar.gz

# Prepare system
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get -y dist-upgrade && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl && \
    apt-get autoremove -y

# Install basic dependencies
RUN apt-get update -y && \
    apt-get install -y \
    bash-completion \
    build-essential \
    ccache \
    cmake \
    doxygen \
    g++ \
    gpsbabel \
    libcrypto++-dev \
    libpcre3-dev \
    libepsilon-dev \
    libfreexl-dev \
    libfyba-dev \
    libogdi3.2-dev \
    libpq-dev \
    libcfitsio-dev \
    libcurl4-gnutls-dev \
    libproj-dev \
    libpng-dev \
    libpng++-dev \
    libpng-tools \
    libpng16-16 \
    libxml2-dev \
    libkml-dev \
    libjpeg-dev \
    libgeos-dev \
    libgif-dev \
    libnetcdf-dev \
    libpoppler-dev \
    libpoppler-private-dev \
    libmysqlclient-dev \
    liblzma-dev \
    libgeos-dev \
    liblcms2-2 \
    libgeotiff-dev \
    libcharls-dev \
    libzstd1-dev \
    libspatialite-dev \
    libhdf4-alt-dev \
    libhdf5-serial-dev \
    libexpat-dev \
    libdap-dev \
    libwebp-dev \
    libxerces-c-dev \
    make \
    netcdf-bin \
    openjdk-8-jdk \
    poppler-utils \
    proj-bin \
    python-dev \
    python3-dev \
    python-numpy \
    python3-numpy \
    software-properties-common \
    sqlite3 \
    swig \
    texlive-latex-base \
    unixodbc-dev \    
    vim                             

# Compile and install OpenJPEG
RUN cd src && \
    tar -xvf openjpeg-${OPENJPEG_VERSION}.tar.gz && \
    cd openjpeg-${OPENJPEG_VERSION}/ && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$ROOTDIR && \
    make && \
    make install && \
    make clean && \
    cd $ROOTDIR && \
    rm -Rf src/openjpeg*

# Compile and install GDAL
RUN cd src && \
    tar -xvf gdal-${GDAL_VERSION}.tar.gz && \
    cd gdal-${GDAL_VERSION} && \
    ./configure \
    --with-cpp14 \
    --with-png=internal \
    --with-libtiff=internal \
    --with-geotiff=internal \
    --with-jpeg=internal \
    --with-gif=internal \
    --with-python \
    --with-spatialite \
    --with-pg \
    --with-curl \
    --with-openjpeg \
    --enable-debug \
    --with-python \
    --with-poppler \
    --with-mysql \
    --with-liblzma \
    --with-webp \
    --with-epsilon \
    --with-threads=yes \
    --with-proj \
    --with-hdf5 \
    --with-dods-root=/usr \
    --with-sosi \
    --without-libtool && \
    make -j $(nproc) && \
    make install && \ 
    ldconfig && \
    apt-get update -y && \
    cd $ROOTDIR && \
    cd src/gdal-${GDAL_VERSION}/swig/python && \
    python3 setup.py build && \
    python3 setup.py install && \
    apt-get remove -y --purge build-essential python-dev python3-dev && \
    cd $ROOTDIR && \ 
    rm -Rf src/gdal*
