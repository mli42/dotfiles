function cd() { builtin cd $* && if [ "$1" != '-' ]; then pwd; fi && ls; }

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

function lfor () {
	argc=$#
	search=""
	vflag="-v"

	for ((i=1; i <= argc; i++)); do
		if [ "${(P)i}" = "$vflag" ]; then break ; fi
		if [ $i -ne 1 ]; then search+=" "; fi
		search+="${(P)i}";
	done
	todo="grep -rn \"$search\" ."
	if [ "${(P)i}" = "$vflag" ]; then
		((i++))
		for ((; i <= $argc; i++)); do
			todo+=" | grep -v \"${(P)i}\""
		done
	fi
	todo+=" | grep --color=auto \"$search\""
	eval $todo || echo "Nothing found for '$search'."
}

function scurl () {
	if [ -z "$2" ]; then
		2=$(echo "$1" | rev | cut -d '/' -f1 | rev)
	fi
	curl --output $2 $1
}

function gpp () {
	clang++ -Wall -Wextra -Werror -std=c++98 $*
}

function decorateandplay () {
	echo "\t\t\e[1;93m####\e[m \e[1;94m$*\e[m \e[1;93m####\e[0m" && eval "$*"
}

function seeplace () {
	decorateandplay "df -h"
	decorateandplay "du -hd1 2>/dev/null ~ | sort -h"
}

function gundo () {
	if [ -z "$1" ]; then 1="."; fi
	git checkout -- $*
}

function nodstore () {
	if [ -z "$1" ]; then 1=".DS_Store"; fi
	if [ -z "$2" ]; then 2="f"; fi
	eval find . -type $2 -name '$1' -delete -print
}

function notif () {
	osascript -e "display notification \"$2\" with title \"$1\""
}

function wifi () {
	if [ "$1" != "on" ] && [ "$1" != "off" ]; then
		echo "wifi bad use: {on/off} [en.]"
		return 1;
	fi
	if [ -z "$2" ]; then 2="en1"; fi
	networksetup -setairportpower $2 $1
	[ $? -eq 0 ] && notif "Wifi" "Turned $1"
}

function fclose () {
	if [ -z "$1" ]; then 1="Finder"; fi
	if [ -z "$2" ]; then 2="1"; fi
	AppToClose="$1"
	NbOfWindow="$2"
	osascript -e "tell application \"$AppToClose\" to close window $NbOfWindow"
}
