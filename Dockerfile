FROM jupyter/tensorflow-notebook

# pandas reader
RUN  conda install --quiet --yes \
    'pandas-datareader=0.7.0' && \

# mpl-finance
    pip install mpl-finance==0.10.0 && \

# FinMind
    pip install FinMind==1.0.53 && \

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    rm -rf /home/$NB_USER/.cache

USER root  
# TA-Lib
RUN cd /tmp && \
    wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    rm -rf /root/.cache \
           /tmp/* \
           /var/lib/apt/lists/* && \
    cat /etc/group


# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

RUN pip install ta-lib==0.4.17 && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    rm -rf /home/$NB_USER/.cache