#!/bin/bash

cd cudf/cpp && mkdir -p build && cd build && \
cmake .. -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX \
		 -DBUILD_TESTS=OFF && \
make -j && make install && \
make python_cffi && make install_python && \
cd ../../python && python setup.py build_ext --inplace && \
python setup.py install && \
cd $RAPIDS_ROOT