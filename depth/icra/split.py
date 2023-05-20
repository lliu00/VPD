
from PIL import Image
from glob import glob
import os

import numpy as np
from tqdm import tqdm
import csv

from natsort import natsorted

nyuicra_path_list = glob('/ssd/ll/VPD/depth/nyu_c/*/3/*.jpg')

# for item in nyuicra_path_list:
#     item = item.split(".jpg")[0].split("sample_")[1] + item


nyuicra_path_list = natsorted(nyuicra_path_list)

filename = "./train_nyu_c.txt"
with open(filename, "w") as f:
    for path in tqdm(nyuicra_path_list):
        scene_name = path.split("_rgb")[0].split("3/")[1]
        scene_id = path.split("rgb_")[1].split(".jpg")[0]
        gt_path = "/data1/dataset/nyu_depth_v2/sync/" + scene_name + "/"+  "sync_depth_" + scene_id + ".png"
        f.write(path +" " +gt_path+"\n")
f.close()
