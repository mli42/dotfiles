function cd() { builtin cd $* && if [ $1 != '-' ]; then pwd; fi && ls; }

function ft_valgrind() {
	for i in "$@"; do
		if [[ $i == ./* ]]; then
			cmd=$(nm -an $i | grep asan)
			if [[ $? == 0 ]]; then
				echo -e "\e[0;91m/!\\ Compiled with -fsanitize.\e[0m"
			else
				command valgrind --suppressions=${MY_CONFIG}/basics.supp \
				--suppressions=${MY_CONFIG}/valgrind_minishell.supp $*
			fi
			break
		fi
	done
}
alias valgrind="ft_valgrind"

function lfor () { grep -rn "$*" . || echo "Nothing found for '$*'." }
