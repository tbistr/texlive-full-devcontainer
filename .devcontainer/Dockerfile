FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-21.04

COPY tex.profile ./

RUN wget https://texlive.texjp.org/2021/tlnet/install-tl-unx.tar.gz \
    && mkdir install-tl \
    && tar xzf install-tl-unx.tar.gz -C install-tl --strip-components 1 \
    && ./install-tl/install-tl \
    --profile ./tex.profile \
    --repository http://texlive.texjp.org/2021/tlnet \
    && rm -r install-tl-unx.tar.gz install-tl

# resolve dependencies of latexindent...
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libunicode-linebreak-perl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# RUN set -x \
#     && echo "ALL ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers.d/ALL \
#     && groupadd \
#     --gid 1000 \
#     vscode \
#     && useradd \
#     --uid 1000 \
#     --gid 1000 \
#     --home-dir /home/vscode \
#     --create-home \
#     --shell /bin/bash \
#     vscode

USER vscode

RUN echo 'export PATH="$PATH:/opt/texlive/2021/bin/x86_64-linux"' >> ~/.bashrc
