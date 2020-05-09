export USER="mli"
export MAIL="mli@student.42.fr"

alias gogo_gadget_compile="gcc -Wall -Werror -Wextra"
alias gogo_gadget_compile_db="gcc -Wall -Werror -Wextra -fsanitize=address -g3"

alias mzsh="vim ~/dotfiles/zshrc"
alias mvim="vim ~/dotfiles/vimrc"
alias mdot="cd ~/dotfiles && here"
alias mbin="cd ~/dotfiles/my_bin && here"

alias gogo_gadget_desk="cd ~/Desktop && here"
alias gogo_gadget_projects="cd ~/Desktop/Projects/ && here"
alias gogo_gadget_fac="cd ~/Desktop/Projects/Python_Fac && here"
alias gogo_gadget_working_on="cd ~/Desktop/Projects/working_on && here"
alias thp="cd ~/Desktop/Projects/THP && here"
alias gogo_gadget_libft="cd ~/Desktop/Projects/cub3D/libft && here"
alias gogo_gadget_gnl="cd ~/Desktop/Projects/cub3D/libft/GNL && here"
alias gogo_gadget_printf="cd ~/Desktop/Projects/cub3D/libft/ft_printf && here"
alias gogo_gadget_cub3D="cd ~/Desktop/Projects/cub3D && here"
alias gogo_gadget_bootcamp_py="cd ~/Desktop/Projects/bootcamp_py && here"
alias gogo_gadget_server="cd ~/Desktop/Projects/ft_server && here"
alias gogo_gadget_exams="cd ~/Desktop/Projects/exams/03 && here"
alias gogo_gadget_asm="cd ~/Desktop/Projects/libasm && here"
alias gogo_gadget_minishell="cd ~/Desktop/Projects/charmstr && here"
alias gogo_gadget_akante="cd ~/Desktop/Projects/Akante && here"
alias here="clear && pwd && ls && chaton"
alias chaton="Anais"

alias srcs="source ~/.zshrc"
alias state="git status"
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

gogo_gadget_minishell

alias doruby="cd ~/Desktop/Projects/THP_rendu/semaine_02/jour_01 && here"
alias dobot="cd ~/Desktop/Projects/MeandreBot && here"

export PS1="🐈 ${PS1}"
export PS2="🤡 ${PS2}"

source ~/42toolbox/shell_utils.sh
source ~/dotfiles/my_bin/install_things.sh
