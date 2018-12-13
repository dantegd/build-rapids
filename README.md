# RAPIDS

[RAPIDS: The Rapid Acceleration Platform for Integrated Data Science](https://rapids.ai) comprises the following:

* cudf
* cuml
* cugraph

and requires other frameworks to be useful in an end-to-end workflow, like:

* xgboost
* dask-cudf
* dask-xgboost

... This list is likely to grow. In an effort to streamline one's ability to build-from-source all of the libraries in a single, unified environment, this repository aggregates:

* A set of `utils` to build and install all of the library components that make up RAPIDS
* A `conda-environments/rapids.yml` to specify all dependencies for all the library components that make up RAPIDS
* A set of version-fixed repositories which are guaranteed to work together, so that developers/users always have something _that works_

## Procedure

1. Install `miniconda3/bin`:

```bash
$ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ bash Miniconda3-latest-Linux-x86_64.sh
```

Some notes:
* Be sure to add `miniconda3` to your `PATH`
* You may need the following specified in your `.bashrc`:
```bash
# cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH

# libnvvm
export NUMBAPRO_NVVM=/usr/local/cuda/nvvm/lib64/libnvvm.so
export NUMBAPRO_LIBDEVICE=/usr/local/cuda/nvvm/libdevice
```

2. Clone this repository:

```bash
$ git clone --recursive https://github.com/rapidsai/build-rapids.git
```

3. Build RAPIDS:

```bash
$ cd build-rapids
$ bash build-rapids.sh
```
