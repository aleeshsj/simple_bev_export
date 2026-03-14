# Simple-BEV: What Really Matters for Multi-Sensor BEV Perception?

This is the  code contains export and evaluation of simpple bev model for the arXiv paper on BEV perception. 

[[Paper](https://arxiv.org/abs/2206.07959)] [[Project Page](https://simple-bev.github.io/)]

<img src='https://simple-bev.github.io/videos/output_compressed.gif'>



## Requirements

The lines below should set up a fresh environment with everything you need: 
```
conda create --name bev python==3.9
source activate bev 
pip install -r src/requirements.txt
```

You will also need to download [nuScenes](https://www.nuscenes.org/) and its dependencies.


## Pre-trained models

To download a pre-trained camera-only model, run this:

```
sh get_rgb_model.sh
```
When evaluated at `res_scale=2` (`448x800`), this model should show a final trainval mean IOU of `47.6`, which is slightly higher than the number in our arXiv paper (`47.4`). 

To download a pre-trained camera-plus-radar model, run this:

## Baseline Evaluation

A evaluation command is included in `eval.sh`.

To evaluate a camera-only model, run a command like this:
```
python eval_nuscenes.py \
       --batch_size=16 \
       --data_dir='../nuscenes' \
       --log_dir='logs_eval_nuscenes_bevseg' \
       --init_dir='checkpoints/8x5_5e-4_rgb12_22:43:46' \
       --res_scale=2 \
       --device_ids=[0]
```
| Model | Iou | log | 
| :---: | :---: | :---: | 
| camera-only model | 47.2 | - [log](log/baseline_full_dataset.txt)  | 
| camera-only model | 52.03 | - [log](log/eval_mini_dataset)  | 
## ONNX export

Export pytorch model to onnx is included in `export.sh`.

```
python ./src/eval_nuscenes.py \
       --batch_size=1 \
       --exp_name=${EXP_NAME} \
       --dset='mini' \
       --data_dir=$DATA_DIR \
       --log_dir='./artifacts/logs_eval_nuscenes' \
       --init_dir="checkpoints/${MODEL_NAME}" \
       --res_scale=2 \
       --device_ids=[0] \
       --export=True \
       --onnx_runtime=False
```
## Verfication of ONNX 

Verify the exported onnx model vs pytocrh model is included in `verify.sh`.

```
python ./src/eval_nuscenes.py \
       --batch_size=1 \
       --exp_name=${EXP_NAME} \
       --dset='mini' \
       --data_dir=$DATA_DIR \
       --log_dir='./artifacts/logs_eval_nuscenes' \
       --init_dir="checkpoints/${MODEL_NAME}" \
       --res_scale=2 \
       --device_ids=[0] \
       --export=False \
       --onnx_runtime=True
```



## Citation

Credits
**Simple-BEV: What Really Matters for Multi-Sensor BEV Perception?**.
[Adam W. Harley](https://adamharley.com/),
[Zhaoyuan Fang](https://zfang399.github.io/),
[Jie Li](https://www.tri.global/about-us/jie-li/),
[Rares Ambrus](https://www.csc.kth.se/~raambrus/),
[Katerina Fragkiadaki](http://cs.cmu.edu/~katef/). In arXiv:2206.07959.

Bibtex:
```
@inproceedings{harley2022simple,
  title={Simple-{BEV}: What Really Matters for Multi-Sensor BEV Perception?},
  author={Adam W. Harley and Zhaoyuan Fang and Jie Li and Rares Ambrus and Katerina Fragkiadaki},
  booktitle={arXiv:2206.07959},
  year={2022}
}
```
