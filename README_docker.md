# Semantic-MapNet Docker

## Download Dataset

* Download https://drive.google.com/drive/folders/1Fwbq7Bvl4kIjJ-YOJNbYWHD_6Gh8lFwQ?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_densePC_objectsonly or data/object_point_clouds

* Download https://drive.google.com/drive/folders/1aM9vfDckY6K81mrVhVLmEX5rKZ2B1Q5r?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_semmap or data/semmap

* `cd data && ./download_mp_habitat.sh`, Download and unzip Matterport3D to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/Matterport3D or data/mp3d

## Download Pretrained Model (Optional)

* Download https://drive.google.com/file/d/1KsJoTs91ez2bR35wW1VlD8jBG_gB-k7a/view?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model or model/

* Download https://drive.google.com/file/d/1PZDwl6dmIl6bhmWG42aRGyghgQQWTOcz/view?usp=sharing to /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model or model/

## Build Docker

* `./build.sh`

* `./run.sh`

* `cd Semantic-MapNet`

* `pip install -r requirements.txt`

* Follow instructions in README.md [Workflow]