#!/bin/bash
set -v
set -e
# This script shows how to build the Docker image and push it to ECR to be ready for use
# by SageMaker.
# here we need to specify aksk

# The argument to this script is the image name. This will be used as the image on the local
# machine and combined with the account and region to form the repository name for ECR.
image=$1

if [ "$image" == "" ]
then
    echo "Use image name semantic-mapnet"
    image="semantic-mapnet"
fi

# Get the account number associated with the current IAM credentials
account=$(aws sts get-caller-identity --query Account --output text)

if [ $? -ne 0 ]
then
    exit 255
fi

# Get the region defined in the current configuration
#if you only want to specify one region, use region, otherwise, use regions
region=$(aws configure get region)

if [[ $region =~ ^cn.* ]]
then
    fullname="${account}.dkr.ecr.${region}.amazonaws.com.cn/${image}:latest"
else
    fullname="${account}.dkr.ecr.${region}.amazonaws.com/${image}:latest"
fi
echo ${fullname}

# Get the login command from ECR and execute it directly
$(aws ecr get-login --registry-ids ${account} --region ${region} --no-include-email)

docker pull ${fullname}
docker tag ${fullname} ${image}

mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/training/smnet_training_data/
mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/training/smnet_training_data_semmap/
mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/training/smnet_training_data_indices/
mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/training/smnet_training_data_maxHIndices/
mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/test_data/projections/
mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/test_data/features/
mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/outputs/semmap/
mkdir -p /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/freespace_map/

nvidia-docker run -it --shm-size 16G -p 6006:6006 \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_densePC_objectsonly:/opt/ml/code/Semantic-MapNet/data/object_point_clouds \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_semmap:/opt/ml/code/Semantic-MapNet/data/semmap \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/Matterport3D/v1/tasks/mp3d:/opt/ml/code/Semantic-MapNet/data/mp3d \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model:/opt/ml/code/Semantic-MapNet/model \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/training:/opt/ml/code/Semantic-MapNet/data/training \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/test_data:/opt/ml/code/Semantic-MapNet/data/test_data \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/outputs:/opt/ml/code/Semantic-MapNet/data/outputs \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/objectnav_mp3d_v1:/opt/ml/code/Semantic-MapNet/data/ObjectNav/objectnav_mp3d_v1 \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/semmap:/opt/ml/code/Semantic-MapNet/data/ObjectNav/semmap \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/freespace_map:/opt/ml/code/Semantic-MapNet/data/ObjectNav/freespace_map \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/ObjNav_GT_goals.json:/opt/ml/code/Semantic-MapNet/data/ObjectNav/ObjNav_GT_goals.json \
semantic-mapnet
