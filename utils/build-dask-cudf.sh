#!/bin/bash

cd dask-cudf && python setup.py install && \
cd $RAPIDS_ROOT