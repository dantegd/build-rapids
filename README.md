# RAPIDS

[RAPIDS: The Rapid Acceleration Platform for Integrated Data Science](https://rapids.ai) comprises the following:

* cudf
* cuml
* cugraph

and requires other frameworks to be useful in an end-to-end workflow, like:

* xgboost
* dask-cudf
* dask-xgboost

... This list is likely to go. In an effort to streamline one's ability to build-from-source all of the libraries in a single, unified environment, this repository aggregates:

* A set of `util`ities to build and install all of the core library components that make up RAPIDS
* A `rapids.yml` to specify all dependencies for all the core library components that make up RAPIDS
* A set of version-fixed repositories which are guaranteed to work together, so that developers/users always have something _that works_