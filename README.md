# [HEASoft](https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/) docker image creation:


## Default beaviour of the container:
Launched without option this container run the command: fhelp xspec

# Where to start

## Install docker:
Short version (may not be the last version):
  Fedora/RedHat:

        $ sudo dnf install docker

## Run docker daemon:
  Fedora/RedHat:

        $ sudo systemctl start docker

Complete story:
[Install docker](https://docs.docker.com/engine/installation/)

## Run an interactive shell in a container:

  Short version:
        docker run -t -i \<container_ID\> /bin/bash

        docker run -t -i ubuntu /bin/bash

Links to the [official docker documentation](https://docs.docker.com/):

[Docker basics](https://docs.docker.com/engine/userguide/basics/)


# Build your hown HEASoft container:


## Clone the HEASoft git repo:

        $ cd <work_space>
        $ git clone https://github.com/ldouchy/docker_HEASoft.git

## Build a container:

  Short version:
        docker build \<path_to_the_Dokerfile\>

## Run the build:

        $ docker build -t <TAG> .

  You should obtain the container ID:

        Successfully built e553342157db

[Build a container](https://docs.docker.com/reference/builder/)


## Run the container with an interractive shell

        $ sudo docker run -t -i e553342157db /bin/bash


# How to customized your installation:

## Customize the Dockerfile to add your own code

## Save your HEASoft instance:


# HEASoft links

[official download page](https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/download.html)

[Ubuntu specific install guide](https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/ubuntu.html)

[General install guide](https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/install.html)

[HEAsoft v6.17 - Known Issues](https://heasarc.gsfc.nasa.gov/lheasoft/issues.html)

[PyXspec documentation](https://heasarc.gsfc.nasa.gov/xanadu/xspec/python/PyXspec.pdf)

