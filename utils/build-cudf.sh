#!/bin/bash

cd cudf/cpp && mkdir build && cd build && \
cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX && \
make -j && make install && \
make python_cffi && make install_python && \
cd python && py.test -v && \
cd ../../../python && python setup.py build_ext --inplace && \
python setup.py install && py.test -v && \
cd $RAPIDS_ROOT