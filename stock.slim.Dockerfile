FROM alpine:latest

ARG LV_BRANCH='release-1.2/neovim-0.8' 
RUN apk add git neovim ripgrep alpine-sdk bash --update

RUN curl https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh -O

RUN LV_BRANCH=$LV_BRANCH bash install.sh --no-install-dependencies 

RUN echo 'export LV_PATH=/root/.local/bin/' >> /root/.bashrc
RUN echo 'export PATH=$LV_PATH:$PATH' >> /root/.bashrc

CMD "bin/bash"
