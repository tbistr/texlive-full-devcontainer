FROM mcr.microsoft.com/vscode/devcontainers/base:debian-11

LABEL org.opencontainers.image.source=https://github.com/tbistr/texlive-full-devcontainer

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1

WORKDIR /tmp

# install dummy package to satisfy dependencies of texlive-full for apt.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    equivs wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget http://www.tug.org/texlive/files/debian-equivs-2023-ex.txt \
    && equivs-build debian-equivs-2023-ex.txt \
    && dpkg -i texlive-local_2023.99999999-1_all.deb

# install texlive-full.
RUN wget https://texlive.texjp.org/2023/tlnet/install-tl-unx.tar.gz && \
    tar xvf install-tl-unx.tar.gz && \
    cd install-tl-* && \
    echo "selected_scheme scheme-full" > ./texlive.profile && \
    echo "option_doc 0" >> ./texlive.profile && \
    echo "option_src 0" >> ./texlive.profile && \
    ./install-tl -profile ./texlive.profile && \
    cd .. && \
    rm -rf install-tl-*

# resolve dependencies of latexindent.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libunicode-linebreak-perl \
    && rm -rf /var/lib/apt/lists/*

USER vscode
RUN echo 'export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH' >> ~/.bashrc
USER root
