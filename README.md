# Description

Dockerization of the [hyStrath](https://github.com/hystrath/hyStrath) simulation software using the OpenFOAM environment. Setup includes modular scripts split into 5 parts and a simple installation process

```
⚙️ OS: Ubuntu 20.04 (Focal Fossa)
📁 Compressed Size: 2.44 GB
🔗 DockerHub: https://hub.docker.com/r/shubanpcs/hystrath
```


# Installation

### Method 1:

1. Clone this repository or download the release
2. Unzip if needed
3. Build the container using the command: `docker build -t hystrath .`

### Method 2:

1. Pull the image from DockerHub using the command: `docker pull shubanpcs/hystrath:release-v1`
2. Enter the shell using the command: `docker exec -it <ID> /bin/bash`

# Loading systems

In templated systems, first run the `./Allrun` script to after configuring system settings in the `system` directory of the system. Keep your system directory as a directory on your host and mount it everytime Docker is initiated. Pull the paraview Docker image and mount the files onto paraview, and run `./pvserver --server-port=11111` after `./Allrun` has completed its run. Connect to server using paraview client. 

![image](https://github.com/shuban-789/hyStrath-notes/assets/67974101/cb1bcee9-50f0-4347-9e9d-45ce44127bb3)

# Notice Board

```sh
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
```
