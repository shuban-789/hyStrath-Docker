# Dependencies

- Critical utilities to get the install script to work
- Install OpenFOAM and ThirdParty from sourceforge
- `sudo add-apt-repository ppa:rock-core/qt4`

# Partitioning

Instlallation depends on space being available on /run. Partition accordingly.

```
echo "tmpfs /run tmpfs defaults,size=1G 0 0" >> /etc/fstab
sudo mount -o remount /run
```

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

# Notes on Docker Install

## Section 1: Unable to Install

✅ Successful on Docker, but the following could not be found
```
E: Unable to locate package qt4-dev-tools
E: Package 'libqt4-dev' has no installation candidate
E: Unable to locate package libqt4-opengl-dev
E: Unable to locate package libqtwebkit-dev
```

> Fix: Add repositories for lipqt before running `apt-update`

## Section 2: OpenFOAM and Thirdparty Download
✅ Successful on Docker, but `wget` was not installed

> Small Fix: Add wget to the install script (DONE)

## Section 2: OpenFOAM installation and setup (Allwmake)
✅ Successful on Docker

## Section 4: Cloning hyStrath
✅ Successful on Docker, but `git` was not installed

> Small Fix: Add git to the install script (DONE)

## Section 5: 
✅ Successful on Docker, but Weird error with `$WM_PROJECT_DIR`

> Fix: For now clone it manually, edit Dockerfile to run from /root

## Section 6 (last section)
TBD
