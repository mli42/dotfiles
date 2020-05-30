export USER="mli"
export MAIL="mli@student.42.fr"

alias gogo_gadget_compile="gcc -Wall -Werror -Wextra"
alias gogo_gadget_compile_db="gcc -Wall -Werror -Wextra -fsanitize=address -g3"

alias mzsh="vim ~/dotfiles/zshrc"
alias mzsh2="vim ~/dotfiles/.config/alias_gadget.zsh"
alias mvim="vim ~/dotfiles/vimrc"
alias mdot="cd ~/dotfiles && here"
alias mbin="cd ~/dotfiles/my_bin && here"

alias srcs="source ~/.zshrc"
alias state="git status"
unalias gst
alias gst="git stash"
alias gitpush="git push && git push GH"
alias gitpush_home="git push && git push GL"
alias nodstore="find . -type f -name '.DS_Store' -delete -print"

export BREW_PATH=${HOME}/.brew/bin
export PATH=${BREW_PATH}:${PATH}

export MINICONDA_PATH=${HOME}/miniconda3/bin
export PATH=${MINICONDA_PATH}:${PATH}

export PATH=${PATH}:${HOME}/dotfiles/my_bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PS1="🐈 ${PS1}"
export PS2="🤡 ${PS2}"

source ~/42toolbox/shell_utils.sh
source ~/dotfiles/my_bin/install_things.sh

source ~/dotfiles/.config/alias_gadget.zsh
source ~/dotfiles/.config/misswritten.zsh

function cd() { builtin cd "$*" && ls; }
