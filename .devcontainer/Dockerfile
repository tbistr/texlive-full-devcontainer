FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git \
    wget \
    perl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

COPY tex.profile ./

RUN wget --no-check-certificate https://texlive.texjp.org/2021/tlnet/install-tl-unx.tar.gz 
RUN mkdir install-tl \
    && tar xzf install-tl-unx.tar.gz -C install-tl --strip-components 1
RUN ./install-tl/install-tl \
    --profile ./tex.profile \
    --repository http://texlive.texjp.org/2021/tlnet

RUN echo 'export PATH="$PATH:/opt/texlive/2021/bin/x86_64-linux"' >> ~/.bashrc

# resolve dependencies of latexindent...
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libunicode-linebreak-perl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
