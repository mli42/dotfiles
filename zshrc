export USER="mli"
export MAIL="mli@student.42.fr"

export DOTFILES=${HOME}/dotfiles
export MY_CONFIG=${DOTFILES}/.config
export MY_BIN=${DOTFILES}/my_bin

alias gogo_gadget_compile="gcc -Wall -Werror -Wextra"
alias gogo_gadget_compile_db="gcc -Wall -Werror -Wextra -fsanitize=address -g3"

alias mzsh="vim ${DOTFILES}/zshrc"
alias mzsh2="vim ${MY_CONFIG}/alias_gadget.zsh"
alias mvim="vim ${DOTFILES}/vimrc"
alias mdot="cd ${DOTFILES} && here"
alias mbin="cd ${MY_BIN} && here"

alias vi="vim"
alias srcs="source ~/.zshrc"
alias state="git status"
alias gstt="git status"
unalias gst
alias gst="git stash"
alias gitpush="git push && git push GH"
alias gitpush_home="git push && git push GL"
alias nodstore="find . -type f -name '.DS_Store' -delete -print"

at42=false
if [ $at42 = true ]; then
	source ${DOTFILES}/at42.zsh
else
	source ${DOTFILES}/athome.zsh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export BREW_PATH=${GOINFRE}/.brew/bin
#export MINICONDA_PATH=${GOINFRE}/miniconda3/bin
#export RVM_PATH=$GOINFRE/.rvm/bin

export PATH=${BREW_PATH}:${MINICONDA_PATH}:${PATH}:${RVM_PATH}:${MY_BIN}

export PS1="🐈 ${PS1}"
export PS2="🤡 ${PS2}"

source ~/42toolbox/shell_utils.sh
source ${MY_BIN}/install_things.sh

source ${MY_CONFIG}/alias_gadget.zsh
source ${MY_CONFIG}/misswritten.zsh

source ${DOTFILES}/custom_function.zsh
