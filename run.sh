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
