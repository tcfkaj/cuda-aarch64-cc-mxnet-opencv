# download xgboost
git clone --recursive https://github.com/dmlc/xgboost
git submodule init
git submodule update

cd xgboost
mkdir build
cd build
cmake \
	-DUSE_CUDA=ON \
	-DUSE_OPENMP=ON \
	-DGPU_COMPUTE_VER=53 \
	.
nproc | xargs -I % make -j%

cd ../python-package
pip install .
