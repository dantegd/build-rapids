#!/bin/bash

cd conda/environments && \
conda env create --name $RAPIDS_ENV_NAME --file rapids.yml&& \
cd $RAPIDS_ROOT
