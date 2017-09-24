#FROM gcr.io/tensorflow/tensorflow:latest-gpu
FROM gcr.io/tensorflow/tensorflow:latest-gpu-py3

USER root 

# Install GFortran for pymc and pymc3
RUN apt update && apt install -y gfortran git

# USER jovyan
ADD ./requirements.txt /tmp/requirements.txt
RUN pip install --upgrade -r /tmp/requirements.txt
RUN rm /tmp/requirements.txt

# install jupyter vim notebook extension

# Create required directory in case (optional)
RUN mkdir -p $(jupyter --data-dir)/nbextensions/vim_binding
RUN jupyter nbextension install https://raw.githubusercontent.com/lambdalisue/jupyter-vim-binding/master/vim_binding.js --nbextensions=$(jupyter --data-dir)/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

RUN mkdir /notebooks/work
RUN mkdir /notebooks/logs