# Get operating system information
source /etc/os-release

# oh-my-zsh installation path.
if [[ $ID == "arch" ]]
then
    ZSH=/usr/share/oh-my-zsh/
else
    ZSH=/home/$USER/.oh-my-zsh/
fi

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="darkblood"

# oh-my-zsh plugins
plugins=(git)

alias ipconfig="ip addr"
alias iwconfig="ip addr"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

if [[ ! -f ~/.path ]]; then
  touch ~/.path
fi

source $ZSH/oh-my-zsh.sh
source ~/.zshfunctions
source ~/.path

neofetch
echo "Updating dotfiles..."
( cd ~ ; git pull )
fpath+=${ZDOTDIR:-~}/.zsh_functions

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
