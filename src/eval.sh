#!/bin/bash

DATA_DIR="/media/bmw/data/BEV/nuscenes/"
# "/media/bmw/data/BEV/nuscenes"
# there should be ${DATA_DIR}/full_v1.0/
# and also ${DATA_DIR}/mini


#  python eval_nuscenes.py        --batch_size=2       
#   --data_dir='/media/bmw/data/BEV/nuscenes'        --log_dir='logs_eval_nuscenes_bevseg'   
#     --init_dir='checkpoints/'        --res_scale=2        --device_ids=[0]
# MODEL_NAME="1x5_3e-4_rgb00_20:04:28"


EXP_NAME="00" # evaluate rgb00 model

python eval_nuscenes.py \
       --batch_size=1 \
       --exp_name=${EXP_NAME} \
       --dset='mini' \
       --data_dir=$DATA_DIR \
       --log_dir='logs_eval_nuscenes' \
       --init_dir="checkpoints/${MODEL_NAME}" \
       --res_scale=1 \
       --device_ids=[0]
