FROM jupyter/tensorflow-notebook

# TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    rm -R ta-lib ta-lib-0.4.0-src.tar.gz && \
    pip install ta-lib==0.4.17 && \
    
# pandas reader
    conda install --quiet --yes \
    'pandas-datareader=0.7.0' && \

# mpl-finance
    pip install mpl-finance==0.10.0 && \

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/* 
