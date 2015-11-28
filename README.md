# [HEASoft](https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/) docker image:

## Acknowledgement

If HEASoft has been useful in your research, please reference this website (http://heasarc.gsfc.nasa.gov/lheasoft/)

  Blackburn, J. K. 1995, in ASP Conf. Ser., Vol. 77, Astronomical
  Data Analysis Software and Systems IV, ed. R. A. Shaw, H. E. Payne,
  and J. J. E. Hayes (San Francisco: ASP), 367.

  The latest XSPEC reference is:
  Arnaud, K.A., 1996, Astronomical Data Analysis Software and Systems V,
  eds. Jacoby G. and Barnes J., p17, ASP Conf. Series volume 101.


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

