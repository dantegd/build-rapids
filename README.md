# Dante's Unofficial RAPIDS cuML Development utilities
**Version: 01/07/19**

*This is a collection of scripts that I've developed to test cuDF, cuML and their integration for my personal development purposes. The objective is to have this branch up to date with build process changes in either repository to aid in **development** of cuML, not for production use of the libraries.*

To build a fresh conda environment with cuDF and cuML fit for development, named `cuml-mmdd` where `mm` is the current month and `dd` is the current day, do the following steps:

1. Install `miniconda3`:

```bash
$ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ bash Miniconda3-latest-Linux-x86_64.sh
```

Some notes:
* Be sure to add `miniconda3/bin` to your `PATH`
* You may need the following specified in your `.bashrc`:
```bash
# cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH

# libnvvm
export NUMBAPRO_NVVM=/usr/local/cuda/nvvm/lib64/libnvvm.so
export NUMBAPRO_LIBDEVICE=/usr/local/cuda/nvvm/libdevice
```

2. Clone this branch of the repo and change directory to the repo root:

```bash
$ git clone git@github.com:dantegd/build-rapids.git --single-branch -b dev-cuml
$ cd build-rapids
```

3. Clone the desired cuDF and cuML branches, for example the 0.6 branches for both:

```bash
$ git clone --recurse-submodules https://github.com/rapidsai/cudf.git --single-branch -b branch-0.6
$ git clone --recurse-submodules https://github.com/rapidsai/cuml.git --single-branch -b branch-0.6
```

4. Run the build script. Note that there is an optional **-g** parameter to specify what architecture to build cuML for, which **significantly** reduces its compilation time:

```bash
$ bash build-rapids.sh -g 70
```

if no `-g` is specified, then cuML is build for all supported architectures.

5. (Optional) To test cuDF, starting in the repo root:

```bash
$ source activate cuml-xxyy
$ cd cudf/python
$ py.test
```

6. (Optional) To test cuML, starting in the repo root:

```bash
$ cd cuml/cuML/build
$ ./ml_test
$ cd ../../python
$ py.test cuML/test
```

After the environment is ready, the normal procedures for building cuDF/cuML can be followed (detailed in their corresponding repository readme's).

## Cleaning folders for a new build

An explicit script for cleaning all the folders to rebuild everything from scratch is coming in the near future, meanwhile you can follow the next steps:

1. Remove cuDF build products:

```bash
$ rm -rf cudf/cpp/build/
$ rm -r rm -rf cudf/python/cudf/bindings/*.cpp
```

2. Remove cuML build products:

```bash
$ rm -rf cuml/cuML/build/
$ rm -rf cuml/python/cuML/cuml.cpp
```

3. (Optional) Remove the conda environment, replacing `mmdd` for their correct number:

```bash
$ source deactivate # Only necessary if conda environment is active
$ conda env remove -n cuml-mmdd -y
```

Afterwards, a new clean environment should be buildable following the instructions in the first section.

## Known issues:

- If using CUDA 10, knn of cuml is not available unless building faiss-gpu from source with cuda10 or using an official RAPIDS container.
- To use knn in CUDA 9.2, it might still be needed to install the corresponding faiss-gpu: `conda install -c pytorch faiss-gpu -y`
- Compilation times of cuML are relatively large for branch 0.5 since the new dbscan, I **highly** recommend scpecifying the gpu architecture due to this.


## Upcoming features:

- Cleaning script
- Automated cloning of cuDF/cuML repos with possibility of selecting the branch.

