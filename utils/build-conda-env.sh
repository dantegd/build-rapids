#!/bin/bash

cd conda/environments && \
conda env create --name rapids --file rapids.yml && \
cd $RAPIDS_ROOT