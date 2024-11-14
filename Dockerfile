# syntax=docker/dockerfile:1
FROM nvcr.io/nvidia/pytorch:20.09-py3

RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install --upgrade pip

ADD . /working-dir

WORKDIR /working-dir

RUN pip3 install -r requirements.txt

WORKDIR /working-dir/ProSTGrid

RUN python3 setup.py install

WORKDIR /working-dir/torchgeometry-0.1.2

RUN python3 setup.py install