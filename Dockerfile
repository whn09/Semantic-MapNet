# from pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel

from nvidia/cudagl:11.0.3-devel-ubuntu18.04

# Install Conda
ARG PYTHON_VERSION=3.8
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         libpng-dev && \
     rm -rf /var/lib/apt/lists/*


RUN curl -o ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install -y python=$PYTHON_VERSION numpy pyyaml scipy ipython mkl mkl-include ninja cython typing && \
     /opt/conda/bin/conda install -y -c pytorch magma-cuda110 && \
     /opt/conda/bin/conda clean -ya
ENV PATH /opt/conda/bin:$PATH

RUN mkdir -p /opt/ml/code/

WORKDIR /opt/ml/code/

# Install habitat-sim

RUN conda install habitat-sim headless -c conda-forge -c aihabitat -y

# Install habitat-lab

RUN git clone --branch stable https://github.com/facebookresearch/habitat-lab.git

RUN cd habitat-lab && pip install -e .

# Install other dependencies

RUN pip install tensorboardX

RUN pip install --ignore-installed PyYAML

RUN pip install open3d plyfile

RUN pip install torch==1.7.0+cu110 torchvision==0.8.1+cu110 -f https://download.pytorch.org/whl/torch_stable.html

# Semantic-MapNet

# RUN git clone https://github.com/whn09/Semantic-MapNet.git
RUN mkdir /opt/ml/code/Semantic-MapNet/
COPY ./requirements.txt /opt/ml/code/Semantic-MapNet/

RUN cd Semantic-MapNet && TORCH_CUDA_ARCH_LIST="3.5 5.2 6.0 6.1 7.0+PTX" TORCH_NVCC_FLAGS="-Xfatbin -compress-all" pip install -r requirements.txt

COPY ./ /opt/ml/code/Semantic-MapNet/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/training/smnet_training_data/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/training/smnet_training_data_semmap/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/training/smnet_training_data_indices/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/training/smnet_training_data_maxHIndices/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/test_data/projections/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/test_data/features/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/outputs/semmap/

RUN mkdir -p /opt/ml/code/Semantic-MapNet/data/ObjectNav/freespace_map/

RUN apt update && apt install -y libpq-dev

RUN pip install geopandas geocube