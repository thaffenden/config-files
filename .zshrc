# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="tristan"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  python
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# shell
alias la='ls -la'
function tarthis() {
    tar -czf $1.tar.gz $1/
}
function toggle-display() {
    current_display=$(xrandr --listmonitors)

    DP_ACTIVE=false
    HDMI_ACTIVE=false

    if [[ $current_display =~ "DP-2" ]]; then
        DP_ACTIVE=true
    fi
    if [[ $current_display =~ "HDMI-0" ]]; then
        HDMI_ACTIVE=true
    fi

    if [[ $DP_ACTIVE == true && $HDMI_ACTIVE == true ]]; then
        echo "Both monitors active, switching to just display port"
        enable_monitor="DP-2"
        disable_monitor="HDMI-0"
    elif [[ $DP_ACTIVE == true && $HDMI_ACTIVE == false ]]; then
        echo "Switching to just HDMI output"
        enable_monitor="HDMI-0"
        disable_monitor="DP-2"
    elif [[ $DP_ACTIVE == false && $HDMI_ACTIVE == true ]]; then
        echo "Switching to just Display Port output"
        enable_monitor="DP-2"
        disable_monitor="HDMI-0"
    fi

    xrandr --output $enable_monitor --auto
    xrandr --output $disable_monitor --off
}
function winboot() {
    WINDOWS_TITLE=`grep -i 'windows' /boot/grub/grub.cfg|cut -d"'" -f2`
    echo 'Booting directly into windows'
    sudo grub-reboot "$WINDOWS_TITLE"
    sudo reboot
}
function mine() {
    cd $HOME
    DIR="$(dirname "$(readlink -f .zshrc)")"
    . $DIR/public_key
    $HOME/eth/ethminer --farm-recheck 200 -G -S eu1.ethermine.org:4444 -FS us1.ethermine.org:4444 -O $PUBLIC_KEY
}
function auto() {
    current_dir="$PWD"
    if [[ -n $VIRTUAL_ENV ]]; then
        current_env="$VIRTUAL_ENV"
        deactivate
    else
        current_env=""
    fi

    cd $HOME/git/auto-remote
    source bin/activate
    python auto_remote.py send --message=$1
    deactivate

    if [[ -n $current_env ]]; then
        cd $current_env
        source bin/activate
    fi
    cd $current_dir
}

# python
alias pl='pip list --format columns'
alias sba='source bin/activate'
function dex() {
    deactivate
    echo 'Deactivated virtual environment'
    exit
}

# git
alias gs='git status'
alias gd='git diff'
alias gpum='git pull upstream master'
alias gpom='git push origin master'
alias gtc='git commit -m "temp"'
function gfpr() {
    git fetch upstream refs/pull-requests/$1/from:$2
    git checkout $2
}

# OS specific settings
case `uname` in
    Darwin)
        export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
        export NVM_DIR=~/.nvm
        source $(brew --prefix nvm)/nvm.sh
        export PATH="/usr/local/opt/node@6/bin:$PATH"
        ;;
esac

