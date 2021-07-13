import json

info = json.load(open('data/semmap_GT_info.json','r'))
print('info:', len(info))
info_houses = {}
for key in info.keys():
    house = key.split('_')[0]
    if house not in info_houses:
        info_houses[house] = 0
    info_houses[house] += 1
print('info_houses:', len(info_houses))

paths = json.load(open('data/paths.json', 'r'))
print('paths:', len(paths))
paths_houses = {}
min_positions = 999999999
max_positions = 0
for key in paths.keys():
    house = key.split('_')[0]
    if house not in paths_houses:
        paths_houses[house] = 0
    paths_houses[house] += 1
    num_positions = len(paths[key]['positions'])
    if num_positions < min_positions:
        min_positions = num_positions
    if num_positions > max_positions:
        max_positions = num_positions
print('paths_houses:', len(paths_houses))

print('17DRP5sb8fy_0:', len(paths['17DRP5sb8fy_0']['positions']))
print('jtcxE69GiFV_1:', len(paths['jtcxE69GiFV_1']['positions']))

print('min_positions:', min_positions)
print('max_positions:', max_positions)

houses_dim = json.load(open('data/houses_dim.json','r'))
print('houses_dim:', len(houses_dim))
houses_dim_houses = {}
only_house_cnt = 0
for key in houses_dim.keys():
    if '_' not in key:
        only_house_cnt += 1
    house = key.split('_')[0]
    if house not in houses_dim_houses:
        houses_dim_houses[house] = 0
    houses_dim_houses[house] += 1
print('houses_dim_houses:', len(houses_dim_houses))
print('only_house_cnt:', only_house_cnt)

envs_splits = json.load(open('data/envs_splits.json.bak', 'r'))
print('envs_splits:', len(envs_splits))
print('envs:', len(envs_splits['envs']))
print('train_envs:', len(envs_splits['train_envs']))
print('val_envs:', len(envs_splits['val_envs']))
print('test_envs:', len(envs_splits['test_envs']))

envs_houses = {}
for key in envs_splits['envs']:
    house = key.split('_')[0]
    if house not in envs_houses:
        envs_houses[house] = 0
    envs_houses[house] += 1
print('envs_houses:', len(envs_houses))

train_envs_houses = {}
for key in envs_splits['train_envs']:
    house = key.split('_')[0]
    if house not in train_envs_houses:
        train_envs_houses[house] = 0
    train_envs_houses[house] += 1
print('train_envs_houses:', len(train_envs_houses))

val_envs_houses = {}
for key in envs_splits['val_envs']:
    house = key.split('_')[0]
    if house not in val_envs_houses:
        val_envs_houses[house] = 0
    val_envs_houses[house] += 1
print('val_envs_houses:', len(val_envs_houses))

train_val_envs_houses = {}
for key in envs_splits['train_envs']+envs_splits['val_envs']:
    house = key.split('_')[0]
    if house not in train_val_envs_houses:
        train_val_envs_houses[house] = 0
    train_val_envs_houses[house] += 1
print('train_val_envs_houses:', len(train_val_envs_houses))

test_envs_houses = {}
for key in envs_splits['test_envs']:
    house = key.split('_')[0]
    if house not in test_envs_houses:
        test_envs_houses[house] = 0
    test_envs_houses[house] += 1
print('test_envs_houses:', len(test_envs_houses))