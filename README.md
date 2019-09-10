# Docker image of MEEP
This repository contains the dockerfile to create the image pymeep hosted at [https://hub.docker.com/r/contisegler/pymeep](https://hub.docker.com/r/contisegler/pymeep).

It is originally based on [sirgogos](https://github.com/sirgogo/docker-meep) image. In the image [scimax/docker-meep-and-mpb](https://github.com/scimax/docker-meep-and-mpb) everything has been replaced completely with the [installation instructions](https://www.mail-archive.com/meep-discuss@ab-initio.mit.edu/msg05850.html) provided by Avadan Oskooi. This image is a continuation.

For more information on MEEP visist the official page at [https://meep.readthedocs.io/en/latest/](https://meep.readthedocs.io/en/latest/).
For more information on MPB visist the official page at [https://mpb.readthedocs.io/en/latest/](https://mpb.readthedocs.io/en/latest/).

# Getting the image from docker hub
```sh
docker pull contisegler/pymeep:<version>
```

# Run the image in interactive mode
```sh
docker run -it --name=<container name> -v /path/to/host/directory:/home/pymeep contisegler/pymeep:<version>
```
This will create a new image which you can restart after exiting the container with
```sh
docker start -i <container name>
```

# Build the image using dockerfile
To build the image place the dockerfile in a directory together with the shell script. Run
```sh
docker build -t pymeep .
```

# Other useful commands
```sh
docker ps -a
````
lists all containers, independent from whether they are running or not.
