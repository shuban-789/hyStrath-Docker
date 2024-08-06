# Description

Dockerization of the [hyStrath](https://github.com/hystrath/hyStrath) simulation software using the OpenFOAM environment. Setup includes modular scripts split into 5 parts and a simple installation process

```
docker pull shubanpcs/hystrath:release-v1
```

🔗 [DockerHub](https://hub.docker.com/r/shubanpcs/hystrath)

# Installation

### Method 1:

1. Clone this repository or download the release
2. Unzip if needed
3. `# docker build -t hystrath .`

### Method 2:

1. Pull the image from [DockerHub](https://hub.docker.com/r/shubanpcs/hystrath)
2. `# docker exec -it <ID> /bin/bash`

# Loading systems

In templated systems, first run the `Allrun` script to create vital files. You will have to recreate this script for your own simulation.

In cmdline, type:
```
dsmcFoam+
```

Boot paraview and plug in the Foam file to view results. Switch the tabs on the top to change the variable of focus.

```
paraview
```

![image](https://github.com/shuban-789/hyStrath-notes/assets/67974101/cb1bcee9-50f0-4347-9e9d-45ce44127bb3)
