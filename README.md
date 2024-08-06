# Description

Dockerization of the [hyStrath](https://github.com/hystrath/hyStrath) simulation software using the OpenFOAM environment.

```
docker pull shubanpcs/hystrath:release-v1
```

🔗 [DockerHub](https://hub.docker.com/r/shubanpcs/hystrath)

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
