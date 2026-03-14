#!/bin/bash

DATA_DIR="/media/bmw/data/BEV/nuscenes/"
MODEL_NAME="8x5_5e-4_rgb12_22:43:46"
EXP_NAME="00" # evaluate rgb00 model

python ./src/eval_nuscenes.py \
       --batch_size=1 \
       --exp_name=${EXP_NAME} \
       --dset='mini' \
       --data_dir=$DATA_DIR \
       --log_dir='./artifacts/logs_eval_nuscenes' \
       --init_dir="checkpoints/${MODEL_NAME}" \
       --res_scale=2 \
       --device_ids=[0]


# # full model v1.0-trainval/
# DATA_DIR="/media/bmw/datasets/nuscenes"
# MODEL_NAME="8x5_5e-4_rgb12_22:43:46"
# EXP_NAME="00" # evaluate rgb00 model

# python ./src/eval_nuscenes.py \
#        --batch_size=1 \
#        --exp_name=${EXP_NAME} \
#        --dset='trainval' \
#        --data_dir=$DATA_DIR \
#        --log_dir='./artifacts/logs_eval_nuscenes' \
#        --init_dir="checkpoints/${MODEL_NAME}" \
#        --res_scale=2 \
#        --device_ids=[0]

