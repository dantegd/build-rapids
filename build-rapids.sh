#!/bin/bash

export RAPIDS_ROOT=$(pwd)
d=$(date +%m%d)
export RAPIDS_ENV_NAME="cuml-$d"

while getopts g: opt; do
  case $opt in
  g)
      export GPU_ARCHS=$OPTARG
      ;;
  esac
done

echo -e "\n Building new conda environment for cuML development: $RAPIDS_ENV_NAME"


bash utils/build-conda-env.sh

source activate $RAPIDS_ENV_NAME && \
bash utils/build-cudf.sh && \
bash utils/build-cuml.sh && \
echo -e "\n Successfully built and installed cuML for development in conda environment $RAPIDS_ENV_NAME \n"




