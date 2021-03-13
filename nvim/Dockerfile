FROM ubuntu:20.10

RUN apt-get -y update && apt-get -y install \
  git \
  neovim \
  curl \
  && apt-get autoclean

ARG USERNAME=t14n
RUN adduser --disabled-password ${USERNAME}; \
  usermod -g sudo ${USERNAME}; \
  passwd -d ${USERNAME}
   
USER ${USERNAME}
ENTRYPOINT ["nvim"]
