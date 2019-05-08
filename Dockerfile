# forked from ufoym/deepo:all-jupyter
# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# tensorflow    latest (pip)
# keras         latest (pip)
# ==================================================================
# $ docker run --runtime=nvidia -it -p 8888:8888 --ipc=host ufoym/deepo:all-jupyter jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/root'

FROM ubuntu:18.04
ENV LANG C.UTF-8
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        apt-utils \
        ca-certificates \
        wget \
        git \
        vim \
        tmux \
        nodejs \
        npm \
        make \
        cmake \
        && \
        
## Ta-lib ==============================================================    
    cd /tmp && \
    wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    rm -rf /root/.cache \
           /tmp/* && \
    cd && \

# $GIT_CLONE https://github.com/Kitware/CMake ~/cmake && \
# cd ~/cmake && \
# ./bootstrap && \
# make -j"$(nproc)" install && \

# ==================================================================
# python
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python3.6 \
        python3.6-dev \
        python3-distutils-extra \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
    $PIP_INSTALL \
        setuptools \
        && \
    $PIP_INSTALL \
        numpy \
        scipy \
        pandas \
        cloudpickle \
        scikit-learn \
        scikit-image \
        matplotlib \
        Cython \
        seaborn \
        xlrd \
        numexpr \
        patsy \
        statsmodels \
        dill \
        dask \
        numba \
        bokeh \
        sqlalchemy \
        vincent \
        protobuf \
        beautifulsoup4 \
        pandas_datareader \
        mpl-finance \
        FinMind \
        jieba \
        ta-lib \
        gensim \
        nltk \
        xgboost \
        lightgbm \
        && \

# ==================================================================
# jupyter
# ------------------------------------------------------------------

    $PIP_INSTALL \
        jupyter \
        jupyterlab \
        jupyterhub \
        && \

# ==================================================================
# tensorflow Keras
# ------------------------------------------------------------------

    $PIP_INSTALL \
        tensorflow \
        keras \
        h5py \
        && \

# jupyterlab-extension----------------------------------------------------
    pip install ipywidgets && \
    jupyter nbextension enable --py widgetsnbextension && \
    
    
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \

    
    jupyter labextension install @jupyterlab/git && \
    $PIP_INSTALL jupyterlab-git && \
    jupyter serverextension enable --py jupyterlab_git && \

    
    jupyter labextension install @lckr/jupyterlab_variableinspector && \


    jupyter lab build && \

# ==================================================================
# config & cleanup the best way is delete every cache and everything in /root except /root/.bashrc
# ------------------------------------------------------------------

    ldconfig && \
    apt-get autoclean && \
    apt-get autoremove && \
    npm cache clean --force && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           ~/* \
           ~/.cache \
           ~/.npm \
           ~/.jupyter \

EXPOSE 6006 8888
