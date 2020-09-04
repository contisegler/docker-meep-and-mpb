# Docker image of MEEP
This repository contains the dockerfile to create the image pymeep hosted at [https://hub.docker.com/r/contisegler/pymeep](https://hub.docker.com/r/contisegler/pymeep).

It is originally based on [sirgogos](https://github.com/sirgogo/docker-meep) image. In the image [scimax/docker-meep-and-mpb](https://github.com/scimax/docker-meep-and-mpb) everything has been replaced completely with the [installation instructions](https://www.mail-archive.com/meep-discuss@ab-initio.mit.edu/msg05850.html) provided by Avadan Oskooi. This image is a continuation.

For more information on MEEP visist the official page at [https://meep.readthedocs.io/en/latest/](https://meep.readthedocs.io/en/latest/).
For more information on MPB visist the official page at [https://mpb.readthedocs.io/en/latest/](https://mpb.readthedocs.io/en/latest/).

## Getting the image from docker hub
```sh
docker pull contisegler/pymeep:<version>
```

## Create a continer in interactive mode
Create a directory which will be accessibel inside docker:
```sh
mkdir </path/to/host/directory>
```
Tere are some problems with file permissions in the mounted volumes in docker, since the user and group id differ inside and outside of docker. I haven't found a good solution so far. The workaround I used so far is giving read, write and execute permissions to all users for the mounted folder:
```sh
chmod a+rwx -R </path/to/host/directory>
```
Create a container from the pymeep image:
```sh
docker run -it --name=<container name> -v </path/to/host/directory>:/home/pymeep/host contisegler/pymeep:<version>
```

## Restart the container
The above created container can be restarted after exiting with:
```sh
docker start -i <container name>
```
The files added by docker will have the uid 999 and gid 999. This user and group ids might not even exist on the host or are at least not sensible. In order to access these files from the host and the docker system change the ownership to the host user and allow access for everyone:
```sh
sudo chown -R $(id -u):$(id -g) </path/to/host/directory>
chmod a+rwx -R </path/to/host/directory>
```

## Build the image using dockerfile
To build the image place the dockerfile in a directory together with the shell script. Run:
```sh
docker build -t pymeep .
```

# Other useful commands
List all containers, independent from whether they are running or not:
```sh
docker ps -a
````
