nvidia-docker run -it --shm-size 16G \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_densePC_objectsonly:/opt/ml/code/Semantic-MapNet/data/object_point_clouds \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_semmap:/opt/ml/code/Semantic-MapNet/data/semmap \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/Matterport3D/v1/tasks/mp3d:/opt/ml/code/Semantic-MapNet/data/mp3d \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model:/opt/ml/code/Semantic-MapNet/model \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/training:/opt/ml/code/Semantic-MapNet/data/training \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/test_data:/opt/ml/code/Semantic-MapNet/data/test_data \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/outputs:/opt/ml/code/Semantic-MapNet/data/outputs \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/objectnav_mp3d_v1:/opt/ml/code/Semantic-MapNet/data/ObjectNav/objectnav_mp3d_v1 \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/semmap:/opt/ml/code/Semantic-MapNet/data/ObjectNav/semmap \
semantic-mapnet
