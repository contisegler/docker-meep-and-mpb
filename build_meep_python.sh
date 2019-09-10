#!/bin/bash

set -e

RPATH_FLAGS="-Wl,-rpath,/usr/local/lib:/usr/lib/x86_64-linux-gnu/hdf5/openmpi"
MY_LDFLAGS="-L/usr/local/lib -L/usr/lib/x86_64-linux-gnu/hdf5/openmpi ${RPATH_FLAGS}"
MY_CPPFLAGS="-I/usr/local/include -I/usr/include/hdf5/openmpi"

apt-get update

apt-get -y install          \
    build-essential         \
    gfortran                \
    libblas-dev             \
    liblapack-dev           \
    libgmp-dev              \
    swig                    \
    libgsl-dev              \
    autoconf                \
    pkg-config              \
    libpng-dev              \
    git                     \
    guile-2.0-dev           \
    libfftw3-dev            \
    libhdf5-openmpi-dev     \
    hdf5-tools              \
    libpython3-dev          \
    python3-numpy           \
    python3-scipy           \
    python3-pip             \
    ffmpeg                  \

mkdir -p ~/install

cd ~/install
git clone --branch v1.4.1 https://github.com/NanoComp/harminv.git
cd harminv/
sh autogen.sh --enable-shared
make && make install

cd ~/install
git clone --branch v4.3.0 https://github.com/NanoComp/libctl.git
cd libctl/
sh autogen.sh --enable-shared
make && make install

cd ~/install
git clone --branch 1.13.1 https://github.com/NanoComp/h5utils.git
cd h5utils/
sh autogen.sh CC=mpicc LDFLAGS="${MY_LDFLAGS}" CPPFLAGS="${MY_CPPFLAGS}"
make && make install

cd ~/install
git clone --branch v1.9.0 https://github.com/NanoComp/mpb.git
cd mpb/
sh autogen.sh --enable-shared CC=mpicc LDFLAGS="${MY_LDFLAGS}" CPPFLAGS="${MY_CPPFLAGS}" --with-hermitian-eps
make && make install

cd ~/install
git clone --branch v0.21 https://github.com/HomerReid/libGDSII.git
cd libGDSII/
sh autogen.sh
make && make install

pip3 install --no-cache-dir mpi4py
export HDF5_MPI="ON"
pip3 install --no-binary=h5py h5py
pip3 install matplotlib>3.0.0

cd ~/install
git clone --branch v1.11.0 https://github.com/NanoComp/meep.git
cd meep/
sh autogen.sh --enable-shared --with-mpi --with-openmp PYTHON=python3 LDFLAGS="${MY_LDFLAGS}" CPPFLAGS="${MY_CPPFLAGS}"
make && make install
