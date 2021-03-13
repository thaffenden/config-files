FROM ubuntu:20.10

RUN apt-get -y update && apt-get -y install \
  git \
  neovim \
  curl \
  sudo \
  && apt-get autoclean

ARG USERNAME=t14n
RUN adduser --disabled-password ${USERNAME}; \
  usermod -g sudo ${USERNAME}; \
  passwd -d ${USERNAME}

RUN curl -Lo "/home/${USERNAME}/.config/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY ./config/init.vim "/home/${USERNAME}/.config/nvim/init.vim"
COPY ./config/plugins "/home/${USERNAME}/.config/nvim/plugins"
RUN sudo chown -R $USERNAME "/home/${USERNAME}"
   
USER ${USERNAME}
ENTRYPOINT ["nvim"]
