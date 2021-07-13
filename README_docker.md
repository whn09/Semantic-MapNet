# Semantic-MapNet Docker

## Download Dataset

* `mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/`

* Download https://drive.google.com/drive/folders/1Fwbq7Bvl4kIjJ-YOJNbYWHD_6Gh8lFwQ?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_densePC_objectsonly or data/object_point_clouds

* Download https://drive.google.com/drive/folders/1aM9vfDckY6K81mrVhVLmEX5rKZ2B1Q5r?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_semmap or data/semmap

* `cd data && ./download_mp_habitat.sh`, Download and unzip Matterport3D to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/Matterport3D or data/mp3d

## Download Pretrained Model

* `mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model/`

* Download https://drive.google.com/file/d/1KsJoTs91ez2bR35wW1VlD8jBG_gB-k7a/view?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model or model/

* Download https://drive.google.com/file/d/1PZDwl6dmIl6bhmWG42aRGyghgQQWTOcz/view?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model or model/

## Build Docker

* `./build.sh`

* `./run.sh`

* `cd Semantic-MapNet`

* Follow instructions in README.md [Workflow]

# Object-Goal Navigation

## Download Dataset

* `cd /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/`

* `wget https://dl.fbaipublicfiles.com/habitat/data/datasets/objectnav/m3d/v1/objectnav_mp3d_v1.zip`

* `unzip objectnav_mp3d_v1.zip -d objectnav_mp3d_v1`

* `cd objectnav_mp3d_v1/train && gzip train.json.gz -d`

* `cd ../../objectnav_mp3d_v1/val && gzip val.json.gz -d`

* `cd ../../objectnav_mp3d_v1/val_mini && gzip val_mini.json.gz -d`

## Download Pretrained Model

* Download and unzip https://drive.google.com/file/d/1wPtJaoDO15OtPcWcXuAbCtGQ3r-MdQM2/view?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/semmap or data/ObjectNav/semmap/

## Run

* `python ObjectNav/build_freespace_maps.py`

* `python ObjectNav/run_astar_planning.py`
