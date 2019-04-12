#!/bin/bash

set -e

git submodule init
git submodule update --recursive

# Build OpenSfM
cd OpenSfM/
git submodule init
git submodule update --recursive
docker build --compress  -t opensfm -f Dockerfile.python3 .
cd ..

# Build Hugin
cd hugin/
docker build --compress  -t hugin .
cd -
cd opv-hugin/
docker build --compress  -t opv-hugin .
cd -

# Build opv-tasks
cd OPV_Tasks/
docker build --compress  -t opv-tasks .
cd -

# Build opv-celery and opv-flower
cd OPV_Celery/
docker build --compress  -t opv-celery .
docker build --compress  -t opv-flower -f Dockerfile-flower .
cd -

# Build opv-dbrest
cd OPV_DBRest/
docker build --compress  -t opv-dbrest .
cd -

# Build opv-dm
cd DirectoryManager/
docker build --compress  -t opv-dm .
cd -
