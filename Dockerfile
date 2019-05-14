# python miniconda3 stock-notebook
# forked from https://github.com/ContinuumIO

FROM ubuntu:bionic-20190424

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /root/conda/bin:$PATH

### apt setting  #######################################

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
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



### miniconda ##########################################


    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.6.14-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /root/conda && \
#    ln -s /root/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /root/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    /bin/bash -c "source /root/.bashrc" && \

#    /root/conda/bin/pip --no-cache-dir install --upgrade jupyter  && \
#    /root/conda/bin/conda install jupyter -y && \



########### pip install ###########
    pip --no-cache-dir install --upgrade \
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
        jupyter \
        jupyterlab \
        jupyterhub \
        tensorflow \
        keras \
        h5py \
        && \


# jupyterlab-extension----------------------------------------------------
    pip install ipywidgets && \
    jupyter nbextension enable --py widgetsnbextension && \
    
    
    jupyter labextension install @jupyter-widgets/jupyterlab-manager && \

    
    jupyter labextension install @jupyterlab/git && \
    pip install jupyterlab-git && \
    jupyter serverextension enable --py jupyterlab_git && \

    
    jupyter labextension install @lckr/jupyterlab_variableinspector && \


    jupyter lab build && \


### clean #########################################
    
    conda clean -afy && \
    rm ~/miniconda.sh && \
    rm -rf /root/conda/pkgs && \
    apt-get autoclean && \
    apt-get autoremove && \
    npm cache clean --force && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/* && \
    rm -rf ~/.cache \
           ~/.npm \
           ~/.jupyter && \
    cd / \

EXPOSE 6006 8888
# CMD    [ "/usr/sbin/sshd", "-D"]
CMD [ "/bin/bash" ]
