#!/bin/bash

cd xgboost && mkdir build && cd build && \
cmake .. -DUSE_NCCL=ON -DUSE_CUDA=ON \
         -DGDF_INCLUDE_DIR=$CONDA_PREFIX/include \
         -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX && \
make -j && make install && \
cd ../python-package && python setup.py install

cd $RAPIDS_ROOT