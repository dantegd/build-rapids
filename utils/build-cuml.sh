#!/bin/bash

cd cuml/cuML && mkdir -p build && cd build && \
cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX && \
make -j && make install && \
cd ../../python && python setup.py build_ext --inplace && \
python setup.py install && \
cd $RAPIDS_ROOT

echo $LD_LIBRARY_PATH