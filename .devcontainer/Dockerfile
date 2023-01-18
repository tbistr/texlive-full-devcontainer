FROM mcr.microsoft.com/vscode/devcontainers/base:debian-11

LABEL org.opencontainers.image.source=https://github.com/tbistr/texlive-full-devcontainer

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1

WORKDIR /tmp

RUN curl https://tug.org/texlive/files/debian-equivs-2022-ex.txt --output texlive-local && \
    sed -i "s/2022/9999/" texlive-local && \
    sed -i "/Depends: freeglut3/d" texlive-local && \
    apt-get update && \
    apt-get install -qy --no-install-recommends equivs \
    gpg gpg-agent \
    rsync && \
    equivs-build texlive-local && \
    dpkg -i texlive-local_9999.99999999-1_all.deb && \
    apt-get install -yf --no-install-recommends && \
    rm -rf ./*texlive* && \
    apt-get remove -y --purge equivs && \
    apt-get autoremove -qy --purge \
    && rm -rf /var/lib/apt/lists/*

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar xvf install-tl-unx.tar.gz && \
    cd install-tl-2* && \
    echo "selected_scheme scheme-full" >  texlive.profile && \
    echo "tlpdbopt_install_docfiles 0" >> texlive.profile && \
    echo "tlpdbopt_install_srcfiles 0" >> texlive.profile && \
    echo "tlpdbopt_autobackup 0"       >> texlive.profile && \
    echo "tlpdbopt_sys_bin /usr/bin"   >> texlive.profile && \
    ./install-tl -profile texlive.profile && \
    cd .. && \
    rm -rf install-tl-*

# resolve dependencies of latexindent...
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libunicode-linebreak-perl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

USER vscode
RUN echo 'export PATH=/usr/local/texlive/2022/bin/x86_64-linux:$PATH' >> ~/.bashrc
