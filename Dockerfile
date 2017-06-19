############################################################
# Dockerfile to build PredictDB Pipeline Containers 
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Jiamao Zheng "jiamaoz@yahoo.com"

# Install basic tools 
RUN apt-get update && apt-get install -y --no-install-recommends \
git \
wget \
tar \
tree \
vim \
net-tools \
build-essential \
python \
python-setuptools \
python-dev \
python-distribute \
python-pip \
r-base \
r-base-dev \
r-recommended 

# Install R packages
RUN R -e "install.packages(c('dplyr', 'bit64', 'doMC', 'RSQLite', 'glmnet', 'data.table'), repos='http://cran.us.r-project.org/', dependencies=TRUE); source('http://bioconductor.org/biocLite.R'); biocLite(c('qvalue'))" 

# Download PredictDB pipeline
RUN git clone https://github.com/jiamaozheng/prediction_model_docker.git

# Set the default directory where CMD will execute
WORKDIR prediction_model_docker/

