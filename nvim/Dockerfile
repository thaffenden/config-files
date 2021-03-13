FROM ubuntu:20.10

RUN apt-get -y update && apt-get -y install \
  git \
  neovim \
  curl \
  && apt-get autoclean

ARG BAT_VERSION="0.18.0"
ARG BAT_PACKAGE="bat_${BAT_VERSION}_amd64.deb"
RUN curl -LO https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/${BAT_PACKAGE}; \
  dpkg -i ${BAT_PACKAGE}; \
  rm ${BAT_PACKAGE}

ARG RIP_GREP_VERSION="12.1.1"
ARG RIP_GREP_PACKAGE="ripgrep_${RIP_GREP_VERSION}_amd64.deb"
RUN curl -LO https://github.com/BurntSushi/ripgrep/releases/download/${RIP_GREP_VERSION}/${RIP_GREP_PACKAGE}; \
  dpkg -i ${RIP_GREP_PACKAGE}; \
  rm ${RIP_GREP_PACKAGE}

ARG USERNAME=t14n
RUN adduser --disabled-password ${USERNAME}; \
  usermod -g sudo ${USERNAME}; \
  passwd -d ${USERNAME}

USER ${USERNAME}

RUN curl -Lo "/home/${USERNAME}/.config/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY ./config/init.vim "/home/${USERNAME}/.config/nvim/init.vim"
COPY ./config/plugins "/home/${USERNAME}/.config/nvim/plugins"

RUN nvim --headless +PlugInstall +qall
   
ENTRYPOINT ["nvim"]
