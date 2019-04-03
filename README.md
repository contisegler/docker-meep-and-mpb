# Docker image of MEEP
This repository contains the dockerfile to create the image pymeep hosted at [https://hub.docker.com/r/scimax/pymeepimage/](https://hub.docker.com/r/scimax/pymeepimage/). It is originally based on [sirgogos](https://github.com/sirgogo/docker-meep) image but I have replaced everything completely with the [installation instructions](https://www.mail-archive.com/meep-discuss@ab-initio.mit.edu/msg05850.html) provided by Avadan Oskooi.

For more information on MEEP visist the official page at [https://meep.readthedocs.io/en/latest/](https://meep.readthedocs.io/en/latest/)

# TODOs
- [ ] Investigae login messege: `LD_LIBRARY_PATH=/usr/local/lib:/usr/lib/x86_64-linux-gnu/hdf5/serial: No such file or directory`
- [x] Create version from latest Dockerfile
- [x] Add tag "latest" to Docker hub

# Getting the image from docker hub
```sh
docker pull contisegler/pymeep
```

# Run the image in interactive mode
```sh
docker run -it --name=<container name> -v /path/to/host/directory:/home/hostSRC -v /path/to/host/Simulation-resutls:/home/hostSRC/Simulation-results contisegler/pymeep
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
