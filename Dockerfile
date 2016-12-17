FROM ubuntu:16.04

MAINTAINER Daniel Dahlmeier <ddahlmeier@gmail.com>

# install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-dev \
	python3-pip \
        python3-setuptools \
    && apt-get clean


# install python packages
RUN pip3 install --upgrade \
    ipykernel \
    jupyter \
    matplotlib \
    numpy \
    scipy \
    scikit-learn \
    Pillow \
    && \
    python3 -m ipykernel.kernelspec


# install tensorflow using pip
# Ubuntu/Linux 64-bit, CPU only, Python 3.5
RUN pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.12.0rc1-cp35-cp35m-linux_x86_64.whl


# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
# COPY notebooks /notebooks

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# expose ports
# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/notebooks"

CMD ["/run_jupyter.sh"]
