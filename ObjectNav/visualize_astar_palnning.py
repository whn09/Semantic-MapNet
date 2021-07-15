import os
import cv2
import json

output_dir = 'data/ObjectNav/'
freespace_map_dir =  'data/ObjectNav/freespace_map/'

outputs = json.load(open(os.path.join(output_dir, 'astar_planning_outputs.json'), 'r'))

print(outputs)

for house in outputs.keys():
    for episode in outputs[house].keys():
        actions = outputs[house][episode]['actions']
        path = outputs[house][episode]['path']
        env = outputs[house][episode]['env']
        img = cv2.imread(os.path.join(freespace_map_dir, env+'.png'))