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

alias srcs="source ~/.zshrc"
alias state="git status"
unalias gst
alias gst="git stash"
alias gitpush="git push && git push GH"
alias gitpush_home="git push && git push GL"
alias nodstore="find . -type f -name '.DS_Store' -delete -print"

export BREW_PATH=${HOME}/.brew/bin
export PATH=${BREW_PATH}:${PATH}

# export MINICONDA_PATH=${HOME}/miniconda3/bin
# export PATH=${MINICONDA_PATH}:${PATH}

export PATH=${PATH}:${MY_BIN}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PS1="🐈 ${PS1}"
export PS2="🤡 ${PS2}"

source ~/42toolbox/shell_utils.sh
source ${MY_BIN}/install_things.sh

source ${MY_CONFIG}/alias_gadget.zsh
source ${MY_CONFIG}/misswritten.zsh

function cd() { builtin cd "$*" && ls; }

function ft_valgrind() {
	for i in "$@"; do
		if [[ $i == ./* ]]; then
			cmd=$(nm -an $i | grep asan)
			if [[ $? == 0 ]]; then
				echo -e "\e[0;91m/!\\ Compiled with -fsanitize.\e[0m"
			else
				command valgrind --suppressions=${MY_CONFIG}/basics.supp \
				--suppressions=${MY_CONFIG}/valgrind.supp $*
			fi
			break
		fi
	done
}
alias valgrind="ft_valgrind"

function lfor () { grep -rn "$*" . || echo "Nothing found for '$*'." }
