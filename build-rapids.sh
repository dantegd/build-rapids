#!/bin/bash

export RAPIDS_ROOT=$(pwd)

bash utils/build-conda-env.sh
source activate rapids && \
bash utils/build-cudf.sh && \
#bash utils/build-cuml.sh && \
#bash utils/build-cugraph.sh && \
bash utils/build-xgboost.sh && \
bash utils/build-dask-cudf.sh && \
bash utils/build-dask-xgboost.sh && \
echo -e "\n successfully built and installed RAPIDS \n"