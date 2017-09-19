FROM jupyter/scipy-notebook

USER root 

# Install GFortran for pymc and pymc3
RUN apt update && apt install -y gfortran

USER jovyan
ADD ./requirements.txt /home/jovyan/requirements.txt
RUN pip3 install --upgrade -r /home/jovyan/requirements.txt
RUN rm ./requirements.txt

# install jupyter notebook extensions
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user


RUN git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

VOLUME /work

RUN mkdir logs
VOLUME /logs
