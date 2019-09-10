# docker run -it ubuntu:18.04 /bin/bash
FROM ubuntu:18.04
LABEL maintainer="hendrik.preuss@tuhh.de"

RUN apt-get update && apt-get install -y wget vim nano git
# apt-get install -y python3 

ADD build_meep_python.sh /home
RUN /bin/bash /home/build_meep_python.sh

# Optional
RUN apt-get install -y imagemagick

RUN echo 'export PYTHONPATH="/usr/local/lib/python3.6/site-packages"' >> ~/.bashrc

RUN mkdir /home/pymeep
VOLUME /home/pymeep
WORKDIR /home/pymeep
