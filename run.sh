nvidia-docker run -it \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_densePC_objectsonly:/opt/ml/code/Semantic-MapNet/data/object_point_clouds/ \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/GT_semmap:/opt/ml/code/Semantic-MapNet/data/semmap/ \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/data/Matterport3D/v1/tasks/:/opt/ml/code/Semantic-MapNet/data/mp3d/ \
 -v /home/ec2-user/SageMaker/dataset/Semantic-MapNet/model:/opt/ml/code/Semantic-MapNet/model \
semantic-mapnet
