export USER="mli"
export MAIL="mli@student.42.fr"

export DOTFILES=${HOME}/dotfiles
export MY_CONFIG=${DOTFILES}/.config
export MY_BIN=${DOTFILES}/my_bin
export MY_SUBVIM=${MY_CONFIG}/vim_config
export LOCALDOCKER=${DOTFILES}/dockerfiles

alias gccw="gcc -Wall -Werror -Wextra"
alias gccwsa="gcc -Wall -Werror -Wextra -fsanitize=address -g3"

alias mzsh="vim ${DOTFILES}/zshrc"
alias mzsh2="vim ${MY_CONFIG}/alias_gadget.zsh"
alias mvim="vim ${DOTFILES}/vimrc"
alias mvim_sub="vim ${MY_SUBVIM}"
alias mdot="cd ${DOTFILES}"
alias mbin="cd ${MY_BIN}"

alias vi="vim"
alias srcs="source ~/.zshrc"
alias state="git status"
alias gstt="git status"
alias gst="git stash"
alias py="python"

EOC=$'\033[0m'
BOLD=$'\033[1m'
RED=$'\033[91m'
CYAN=$'\033[96m'
GREEN=$'\033[92m'
DBLUE=$'\033[94m'
PURPLE=$'\033[95m'
YELLOW=$'\033[93m'

export at42=0
if [ -d /sgoinfre ]; then
	at42=1
	source ${DOTFILES}/at42.zsh
else
	source ${DOTFILES}/athome.zsh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export BREW_PATH=${GOINFRE}/.brew/bin
export MINICONDA_PATH=${GOINFRE}/miniconda3/bin
#export RVM_PATH=$GOINFRE/.rvm/bin

export PATH=/usr/local/bin:${BREW_PATH}:${MINICONDA_PATH}:${PATH}:${RVM_PATH}:${MY_BIN}

export PS1="🐈 ${PS1}"
export PS2="🤡 ${PS2}"

source ${MY_BIN}/install_things.sh

source ${DOTFILES}/custom_function.zsh
source ${MY_CONFIG}/alias_gadget.zsh
source ${MY_CONFIG}/misswritten.zsh

# VSC autopep pycodestyle
export PATH=$PATH:~/Library/Python/3.7/bin
export PATH=$PATH:~/.cargo/bin
