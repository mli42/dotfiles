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

function scurl () {
	if [ -z "$2" ]; then
		2=$(echo "$1" | rev | cut -d '/' -f1 | rev)
	fi
	curl --output $2 $1
}

function gpp () {
	clang++ -Wall -Wextra -Werror $*
}

function decorateandplay () {
	echo "\t\t\e[1;93m####\e[m \e[1;94m$*\e[m \e[1;93m####\e[0m" && eval "$*"
}

function seeplace () {
	decorateandplay "df -h"
	decorateandplay "du -hd1 2>/dev/null ~ | sort -h"
}
