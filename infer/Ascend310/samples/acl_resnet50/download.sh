#!/bin/bash
cur_dir=$(pwd)

function readlinkf() {
    perl -MCwd -e 'print Cwd::abs_path shift' "$1";
}

#######################################
# Step1: Download model weight file
#######################################

# cd ./caffe_model
# wget https://obs-model-ascend.obs.cn-east-2.myhuaweicloud.com/resnet50/resnet50.caffemodel
# cd -


#######################################
# Step2: Convert model to OM file
#######################################

# # export HUAWEI_ASCEND_NPU_DDK_ROOT=/usr/local/Ascend/ascend-toolkit/latest/x86_64-linux_gcc4.8.5
# export HUAWEI_ASCEND_NPU_DDK_ROOT=/usr/local/Ascend/ascend-toolkit/latest/x86_64-linux_gcc7.3.0
# echo "export HUAWEI_ASCEND_NPU_DDK_ROOT=$HUAWEI_ASCEND_NPU_DDK_ROOT"

# export PATH=/usr/local/python3.7.5/bin:$PATH
# export PATH=${HUAWEI_ASCEND_NPU_DDK_ROOT}/atc/ccec_compiler/bin:$PATH
# export PATH=${HUAWEI_ASCEND_NPU_DDK_ROOT}/atc/bin:$PATH
# echo "export PATH=$PATH"

# export PYTHONPATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/atc/python/site-packages/te:$PYTHONPATH
# export PYTHONPATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/atc/python/site-packages/topi:$PYTHONPATH
# export PYTHONPATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/atc/python/site-packages/auto_tune.egg/auto_tune:$PYTHONPATH
# export PYTHONPATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/atc/python/site-packages/schedule_search.egg:$PYTHONPATH
# echo "export PYTHONPATH=$PYTHONPATH"

# export LD_LIBRARY_PATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/acllib/lib64:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/atc/lib64:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/opp/op_proto/built-in:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/toolkit/lib64:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$ASCEND_HOME/driver/lib64:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$ASCEND_HOME/add-ons:$LD_LIBRARY_PATH
# echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH"

# export ASCEND_OPP_PATH=$HUAWEI_ASCEND_NPU_DDK_ROOT/opp
# echo "export ASCEND_OPP_PATH=$ASCEND_OPP_PATH"

# export SOC_VERSION=Ascend310
# echo "export SOC_VERSION=$SOC_VERSION"

# atc --model=caffe_model/resnet50.prototxt \
#     --weight=caffe_model/resnet50.caffemodel \
#     --framework=0 \
#     --output=model/resnet50 \
#     --soc_version=Ascend310 \
#     --input_format=NCHW \
#     --input_fp16_nodes=data \
#     --output_type=FP32 \
#     --out_nodes=prob:0

#######################################
# Step3: Prepare Data file
#######################################
sudo pip3.7.5 install image
cd data/
python3.7.5 ../script/transferPic.py
# -rw-rw-r-- 1 HwHiAiUser HwHiAiUser 301056 Sep 21 15:09 dog1_1024_683.bin
# -rwxr----- 1 HwHiAiUser HwHiAiUser  35635 Sep 21 15:08 dog1_1024_683.jpg
# -rw-rw-r-- 1 HwHiAiUser HwHiAiUser 301056 Sep 21 15:09 dog2_1024_683.bin
# -rwxr----- 1 HwHiAiUser HwHiAiUser  41398 Sep 21 15:08 dog2_1024_683.jpg


