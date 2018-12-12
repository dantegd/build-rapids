#!/bin/bash

cd cuml && mkdir -p build && cd build && \
cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX && \
make -j && make install && \
cd ../../python && python setup.py install && \
cd $RAPIDS_ROOT