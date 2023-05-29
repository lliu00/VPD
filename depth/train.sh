PYTHONPATH="$(dirname $0)/..":"$(dirname $0)/../stable-diffusion":$PYTHONPATH \
CUDA_VISIBLE_DEVICES=6 python3 -m torch.distributed.launch --nproc_per_node=1 --master_port='29502' \
--use_env train.py --batch_size 1 --dataset nyudepthv2 --data_path ./ \
 --max_depth 10.0 --max_depth_eval 10.0 --weight_decay 0.1 \
 --num_filters 32 32 32 --deconv_kernels 2 2 2\
 --flip_test --shift_window_test \
 --shift_size 2 --save_model --layer_decay 0.9 --drop_path_rate 0.3 --log_dir $1 \
  --crop_h 480 --crop_w 480 --epochs 35 --resume-from /ssd/ll/VPD/depth/log_dir_mixaug/0525_nyudepthv2_1__deconv3_32_2_480_480_00005_3e-05_09_01_30/epoch_29_model.ckpt ${@:2}