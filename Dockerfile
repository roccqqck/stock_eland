FROM jupyter/tensorflow-notebook

# pandas reader
RUN  conda install --quiet --yes \
    'pandas-datareader=0.7.0' && \

# mpl-finance
    pip install mpl-finance==0.10.0 && \

# FinMind
    pip install FinMind==1.0.53 && \

# jieba
    pip install jieba==0.39 && \

# jupyterlab-git
    jupyter labextension install @jupyterlab/git && \
    pip install jupyterlab-git && \
    jupyter serverextension enable --py jupyterlab_git && \
    
# ==================================================================
# config & cleanup
# ------------------------------------------------------------------
    conda clean -tipsy && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    rm -rf /home/$NB_USER/.cache/*

USER root
# if we wanna install Ta-lib FROM jupyter/base-notebook
# we have to install it at last RUN
# cuz after install it , the permission of jovyan user directory would be changed
# i still have no answer to fix that problem
RUN cd /tmp && \
    wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    rm -rf /root/.cache \
           /tmp/* \
           /var/lib/apt/lists/*  \

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
RUN fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    pip install ta-lib==0.4.17 && \
    rm -rf /home/$NB_USER/.cache/* && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER \
