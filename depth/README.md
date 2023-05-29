# Depth Estimation 
## Getting Started  

1. Download the checkpoint of [stable-diffusion](https://github.com/runwayml/stable-diffusion) (we use `v1-5` by default) and put it in the `checkpoints` folder. Please also follow the instructions in [stable-diffusion](https://github.com/runwayml/stable-diffusion) to install the required packages.

Install the [mmcv-full](https://github.com/open-mmlab/mmcv) library and some required packages.

```bash
pip install openmim
mim install mmcv-full
pip install -r requirements.txt
```

2. Prepare NYUDepthV2 datasets following [GLPDepth](https://github.com/vinvino02/GLPDepth) and [BTS](https://github.com/cleinc/bts/tree/master).

```
mkdir nyu_depth_v2
wget http://horatio.cs.nyu.edu/mit/silberman/nyu_depth_v2/nyu_depth_v2_labeled.mat
python extract_official_train_test_set_from_mat.py nyu_depth_v2_labeled.mat splits.mat ./nyu_depth_v2/official_splits/
```

Download sync.zip provided by the authors of BTS from this [url](https://drive.google.com/file/d/1AysroWpfISmm-yRFGBgFTrLy6FjQwvwP/view) and unzip in `./nyu_depth_v2` folder. 

Your dataset directory should be:

```
│nyu_depth_v2/
├──official_splits/
│  ├── test
│  ├── train
├──sync/
```

## Training

Run the following instuction to train the model. We recommend using 8 NVIDIA V100 GPUs to train the model with a total batch size of 24. 

```
bash train.sh <LOG_DIR>
```

## Evaluation
Command format:
```
bash test.sh <CHECKPOINT_PATH>
```
For robodepth, we connot give the value of the metric, so the test results are all 0. 

We also provide the checkpoint file, to test it, use command:
```
bash test.sh log_dir/last.ckpt
```
Note that please rename the dataset/nyudepthv2_icra.py file to 'nyudepthv2.py' when test.

