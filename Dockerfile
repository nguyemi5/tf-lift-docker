FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04
RUN ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1
RUN LD_LIBRARY_PATH=/usr/local/cuda/lib64/stubs/:$LD_LIBRARY_PATH python3 setup.py install 
RUN rm /usr/local/cuda/lib64/stubs/libcuda.so.1

FROM tensorflow/tensorflow:1.4.0-devel-gpu

FROM ros:kinetic-robot

RUN apt-get update && apt-get install -y \
    libalglib-dev \
    gnuplot \
    python-pip \
    python-flufl.lock \
    python-opencv \
	libboost-all-dev 
    
RUN python -m pip install \
	h5py \
	scipy \
	parse \
	tqdm