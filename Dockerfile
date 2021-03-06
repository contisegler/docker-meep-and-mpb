# docker run -it ubuntu:18.04 /bin/bash
FROM ubuntu:18.04
LABEL maintainer="hendrik.preuss@tuhh.de"

RUN apt-get update && apt-get install -y \
    wget                    \
    vim                     \
    nano                    \
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
    libmatheval-dev         \
    && apt-get clean

RUN useradd -m pymeep

ADD build_meep_python.sh /home/pymeep
RUN /bin/bash /home/pymeep/build_meep_python.sh

RUN printf 'export PATH="/home/pymeep/.local/bin:${PATH}"\n\
export PYTHONPATH="/usr/local/lib/python3.6/site-packages:/home/pymeep/.local/lib/python3.6/site-packages"\n\
export RPATH_FLAGS="-Wl,-rpath,/usr/local/lib:/usr/lib/x86_64-linux-gnu/hdf5/openmpi"\n\
export LDFLAGS="-L/usr/local/lib -L/usr/lib/x86_64-linux-gnu/hdf5/openmpi ${RPATH_FLAGS}"\n\
export CPPFLAGS="-I/usr/local/include -I/usr/include/hdf5/openmpi"\n\
umask 0002\n' >> /home/pymeep/.bashrc

USER pymeep
RUN mkdir /home/pymeep/host
VOLUME /home/pymeep/host
WORKDIR /home/pymeep/host
