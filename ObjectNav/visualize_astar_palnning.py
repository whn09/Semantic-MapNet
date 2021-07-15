import os
import cv2
import json
from matplotlib.pyplot import fill
import numpy as np

output_dir = 'data/ObjectNav/'
freespace_map_dir =  'data/ObjectNav/freespace_map/'

outputs = json.load(open(os.path.join(output_dir, 'astar_planning_outputs.json'), 'r'))

print('outputs:', len(outputs))

for house in outputs.keys():
    for episode in outputs[house].keys():
        print('house:', house, 'episode:', episode)
        actions = outputs[house][episode]['actions']
        path = outputs[house][episode]['path']
        env = outputs[house][episode]['env']
        print('path:', len(path))

        img = cv2.imread(os.path.join(freespace_map_dir, env+'.png'))
        width = img.shape[1]
        height = img.shape[0]
        print('img:', img.shape)

        path_points = []
        for pathi in path:
            path_points.append([int(pathi[0]/100*width), int(pathi[1]/100*height)])
        path_points = np.array(path_points, np.int32).reshape((-1, 1, 2))
        print('path_points:', path_points.shape)
        
        cv2.circle(img, (path_points[0][0][0], path_points[0][0][1]), 5, color=(255,0,0), thickness=-1)  # blue: start
        cv2.circle(img, (path_points[-1][0][0], path_points[-1][0][1]), 5, color=(0,255,0), thickness=-1)  # green: end
        cv2.polylines(img, [path_points], False, color=(0, 0, 255), thickness=2)  # red: path
        cv2.imwrite(os.path.join(freespace_map_dir, env+'_episode_'+str(episode)+'.png'), img)