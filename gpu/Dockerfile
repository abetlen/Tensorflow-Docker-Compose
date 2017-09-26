FROM gcr.io/tensorflow/tensorflow:latest-gpu-py3

# Install GFortran for pymc and pymc3
RUN apt update && apt install -y gfortran git sudo

RUN useradd -G sudo -G root -m -d /home/ubuntu -s /bin/sh ubuntu
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo '%root ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install --upgrade -r /tmp/requirements.txt
RUN rm /tmp/requirements.txt

# install jupyter vim notebook extension

# Create required directory in case (optional)
USER ubuntu

RUN jupyter contrib nbextension install --user

RUN mkdir -p $(jupyter --data-dir)/nbextensions/vim_binding
RUN git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

WORKDIR /home/ubuntu

RUN mkdir -p /home/ubuntu/work
RUN mkdir -p /home/ubuntu/logs
