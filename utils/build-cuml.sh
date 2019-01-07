#!/bin/bash

if [ -n "$GPU_ARCHS" ]; then
    cd cuml/cuML && mkdir -p build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX -DGPU_ARCHS="$GPU_ARCHS"&& \
    make -j && make install && \
    cd ../../python && python setup.py build_ext --inplace && \
    python setup.py install && \
    cd $RAPIDS_ROOT
else
    cd cuml/cuML && mkdir -p build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX && \
    make -j && make install && \
    cd ../../python && python setup.py build_ext --inplace && \
    python setup.py install && \
    cd $RAPIDS_ROOT
fi
