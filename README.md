# Dependencies

- Critical utilities to get the install script to work
- Install OpenFOAM and ThirdParty from sourceforge
- `sudo add-apt-repository ppa:rock-core/qt4`

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

- Step 1: SUCCESS, BUT 5 packages were unable to install
- Step 2: SUCCESS
- Step 3: SUCCESS
- Step 4: SUCCESS, BUT git was not installed
- Step 5: N/A
- Step 6: FAIL, recheck dependencies

```
E: Unable to locate package qt4-dev-tools
E: Package 'libqt4-dev' has no installation candidate
E: Unable to locate package libqt4-opengl-dev
E: Unable to locate package libqtwebkit-dev
```
