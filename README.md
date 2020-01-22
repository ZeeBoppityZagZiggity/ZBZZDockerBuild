# ZBZZDockerBuild Environment

This repo includes the source files for the ZBZZ.OS as well as a Dockerfile and helper script.
The helper script, `dhelp.sh`, provides ease of use commands to build the Docker image which contains the Kendryte 210 toolchain.
The image also provides the QEMU configured for RISC-V.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

What you need to set this environment is Docker, and of course the git cli tools.


### Installing

Clone this repository, recursively.

```
git clone https://github.com/ZeeBoppityZagZiggity/ZBZZDockerBuild.git --recursively
```

cd to the newly created folder

```
cd ZBZZDockerBuild
```

Build the Docker Image.
Warning, this may error out if internet connection is slow or unreliable since the build stage does some cloning of git repositories which are rather large.

```
./dhelp.sh build
```

Run the Docker Container.
Warning, this will copy the subdirectory, `ZBZZ.OS`, into the container. Any actions performed inside the docker container are assumed to be ran with root privileges on your hard disk.
```
./dhelp.sh run
```

Connect to the Docker Container.
```
./dhelp.sh connect
```

You are now in the Docker Container with the ZBZZ OS files witht the kendryte toolchain and RISC-V QEMU installed.


## Built With

* [Docker](http://www.dropwizard.io/1.0.2/docs/) - The Developer Environment Solution

## Authors

* **Preston Provins** - *Initial work* - [3PIV](https://github.com/3PIV)
* **Charles Rizzo** - *Initial work* - [charizzo](https://github.com/charizzo)
* **Grayson Bruner** - *Initial work* - [grbuner7606](https://github.com/gbruner7607)

## Acknowledgments

* Dr. Marz getting deez ballz rolling.
