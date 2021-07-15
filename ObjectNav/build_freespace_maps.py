import os
import h5py
import numpy as np
from tqdm import tqdm

from scipy.ndimage import binary_closing
from scipy.ndimage import binary_erosion
from scipy.ndimage import binary_dilation

from imageio import imwrite

import cv2
import sys
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = BASE_DIR
sys.path.append(os.path.join(ROOT_DIR, '../'))

folder_pred = 'data/ObjectNav/semmap/'
output_dir =  'data/ObjectNav/freespace_map/'

envs = os.listdir(folder_pred)

envs = [x.split('.')[0] for x in envs]

for env in tqdm(envs):

    file = h5py.File(os.path.join(folder_pred, env+'.h5'), 'r')
    semmap_pred = np.array(file['semmap'])
    height_map = np.array(file['height_map'])
    height_map[height_map>0] = height_map[height_map>0] - height_map[height_map>0].min() + 1
    file.close
    
    n, h = np.histogram(height_map[height_map>0], bins=200)
    ih = np.argmax(n)
    floor_height = h[ih]
    
    nav_map = (height_map>floor_height-0.05) & \
              (height_map<floor_height+0.05)
    
    nav_map = binary_closing(nav_map.astype(int), structure=np.ones((5,5))).astype(np.bool)
    
    nav_map = binary_erosion(nav_map.astype(int), structure=np.ones((10,10))).astype(np.bool)
    nav_map = binary_dilation(nav_map.astype(int), structure=np.ones((5,5))).astype(np.bool)
    
    nav_map = nav_map.astype(np.uint8)
    nav_map *= 255
    nav_map = nav_map.astype(np.uint8)
    
    filename = os.path.join(output_dir, env+'.png')
    imwrite(filename, nav_map)

    from utils.semantic_utils import color_label
    semmap_color = color_label(semmap_pred)
    # semmap_color = semmap_color.transpose(1,2,0)
    semmap_color = semmap_color.astype(np.uint8)
    
    # import matplotlib.pyplot as plt 
    # plt.imshow(semmap_color)
    # plt.axis('off')
    # # plt.show()
    # plt.savefig(os.path.join(output_dir, env+'_color.jpg'), bbox_inches='tight', pad_inches=0.0)
    cv2.imwrite(os.path.join(output_dir, env+'_color.jpg'), semmap_color)


