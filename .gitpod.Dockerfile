FROM gitpod/workspace-full

# Ensure no user interaction is requested
ARG DEBIAN_FRONTEND=noninteractive

USER gitpod

# create group and user and install packages
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b && \
    export PATH=/home/gitpod/miniconda3/bin:$PATH && \
    echo "PATH=/home/gitpod/miniconda3/bin:$PATH" >> /home/gitpod/.bashrc && \
    conda install -c conda-forge -c bioconda python=3.10 pytest samtools && \
    conda install -n base -c conda-forge mamba --yes && \
    mamba create -n genelab-utils -c conda-forge -c bioconda -c defaults -c astrobiomike genelab-utils --yes && \
    pip install mypy black