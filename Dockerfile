from pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel

RUN apt update && apt upgrade -y

RUN apt install -y git

RUN mkdir -p /opt/ml/code/

WORKDIR /opt/ml/code/

# Install habitat-sim

RUN conda install habitat-sim headless -c conda-forge -c aihabitat -y

# Install habitat-lab

RUN git clone --branch stable https://github.com/facebookresearch/habitat-lab.git

RUN cd habitat-lab && pip install -e .

# Install GL and OpenGL

RUN apt install -y ffmpeg libsm6 libxext6 libopengl0

# Install other dependencies

RUN pip install tensorboardX

RUN pip install --ignore-installed PyYAML

RUN pip install open3d plyfile

# Semantic-MapNet

# RUN git clone https://github.com/whn09/Semantic-MapNet.git
COPY ./ /opt/ml/code/Semantic-MapNet

# RUN export TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0+PTX 7.5+PTX"

# RUN cd Semantic-MapNet && pip install -r requirements.txt
