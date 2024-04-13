# A Collection of Energy Exascale Earth System Model (E3SM) Tools

This repository brings together the source code for and tools for building
many of the tools needed to support new meshes (particularly atmosphere
and land meshes) in E3SM.  Submodules are used to bring in code for the tools
from:
* [E3SM v3.0.0](https://github.com/E3SM-Project/E3SM/releases/tag/v3.0.0)
* [CIME v6.0.234](https://github.com/ESMCI/cime/tree/cime6.0.234)
* [SQuadGen](https://github.com/ClimateGlobalChange/squadgen/tree/e39223e31a7b57adc1e5b946bd11dcfbaf52e76e)
This repository only organized the tools under the `tools` subdirectory and
provides CMake builds for each of them.

## Tools

* `cube_to_target` can be used to processing elevation data and remapping to
  a target grid.

* `gen_domain` can be used to generating domain files, which carefully partition
  which portions of the globe belong to the land vs. the ocean and sea ice
  components.

* `interpinic` can be used to interpolate a spun-up land initial condition to
  a new mesh.

* `mksurfcata_map` can be used to remap standard datasets for land surface
   properties to a new E3SM Land Model (ELM) mesh.

* `squadgen` ([Spherical Quadrilateral Mesh Generator](https://github.com/ClimateGlobalChange/squadgen))
  is a mesh generation utility that uses a cubed-sphere base mesh to generate
  quadrilateral meshes with user-specified enhancements.

## Dependencies

All tools require C, C++ and/or Fortran compilers as well as CMake and the
NetCDF C and Fortran libraries.  `cube_to_target` requires `libcurl` (both
include and library files) and `squadgen` requires `libpng` (again, both
include and library files).

## Installing

The dependencies can present a bit of a headache so we recommend installing
either pre-built binaries for the tools and their dependencies (the conda
package) or building the tools using [spack](), which can also build the
dependencies.

### Installing the conda package

If you don't already have conda installed somewhere, install
[Miniforge3](https://github.com/conda-forge/miniforge?tab=readme-ov-file#miniforge3)
for your machine.  E3SM HPC machines are currently all linux64.  It is a good
idea not to have the install update your `.bashrc` to automatically activate
the conda base environment because this might interfere with normal E3SM
development

After installing, you will first activate the base environment:
``` bash
source $HOME/miniforge3/etc/profile.d/conda.sh
conda activate
```
(replacing `$HOME/miniforge3` with the appropriate path for your installation)
and then create a new environment for running `e3sm-tools`:
``` bash
conda create -y -n e3sm-tools -c e3sm e3sm-tools
conda activate e3sm-tools
```

Alternatively, if you already have a conda environment that you would like to
add `e3sm-tool` to, you can do:
``` bash
conda activate my-env
conda install -y -c e3sm e3sm-tools
```

All 6 tools should be available in your path.

### Installing from spack

Not yet supported, but coming soon!


## Building

### Building the conda package

If you don't have conda installed, follow the instructions above to install it.

First, activate the base environment:
``` bash
source $HOME/miniforge3/etc/profile.d/conda.sh
conda activate
```
replacing `$HOME/miniforge3` with the appropriate path for your installation.

Next, install `conda-build`:
``` bash
conda install -y conda-build
```

Then, build the recipe:
``` bash
conda build -m conda/ci/linux_64.yaml conda/recipe
```

Finally, assuming all goes well with the build, you can create a conda
environment with the local package by doing:
``` bash
conda create -y -n e3sm-tools --use-local e3sm-tools
conda activate e3sm-tools
```
