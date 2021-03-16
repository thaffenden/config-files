FROM ubuntu:20.10

RUN apt-get -y update && apt-get -y install \
  git \
  neovim \
  curl \
  nodejs \
  npm \
  && apt-get autoclean

# Install bat - used for file previews in fzf search in vim.
ARG BAT_VERSION="0.18.0"
ARG BAT_PACKAGE="bat_${BAT_VERSION}_amd64.deb"
RUN curl -LO https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/${BAT_PACKAGE}; \
  dpkg -i ${BAT_PACKAGE}; \
  rm ${BAT_PACKAGE}

# Install rip grep - used with fzf for vim search.
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

# Install vim-plug, and copy all the config files to the correct places
ARG NVIM_CONFIG="/home/${USERNAME}/.config/nvim"
RUN curl -Lo "${NVIM_CONFIG}/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY ./config/coc-settings.json "${NVIM_CONFIG}/coc-settings.json"
COPY ./config/functionality "${NVIM_CONFIG}/functionality"
COPY ./config/lua "${NVIM_CONFIG}/lua"
COPY ./config/plugins "${NVIM_CONFIG}/plugins"
COPY ./config/theme "${NVIM_CONFIG}/theme"
COPY ./config/UltiSnips "${NVIM_CONFIG}/UltiSnips"
COPY ./config/init.vim "${NVIM_CONFIG}/init.vim"
COPY ./config/init.lua "${NVIM_CONFIG}/init.lua"

# Install plugins
RUN nvim --headless +PlugInstall +qall
RUN nvim --headless +'CocInstall -sync \
 coc-docker \
 coc-eslint \ 
 coc-flutter \ 
 coc-json \ 
 coc-lua \
 coc-markdownlint \
 coc-prettier \ 
 coc-pyright \
 coc-python \ 
 coc-sh \
 coc-snippets \
 coc-tsserver \ 
 coc-yaml' +qall
RUN nvim --headless +CocUpdateSync +qall
RUN nvim --headless +'CocCommand -sync eslint.showOutputChannel' +1 +qall

ENTRYPOINT ["nvim"]
