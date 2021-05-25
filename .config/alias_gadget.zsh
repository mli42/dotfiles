projectsdir="~/Desktop/Projects/"
alias gogo_desk="cd ~/Desktop"

# Creating associative array
declare -A gogo
GH_USER=mli42

gogo[projects]=".:"
gogo[fac]="Python_Fac:"
gogo[working_on]="working_on:$GH_USER/working_on"
gogo[libft]="libft:$GH_USER/at42libft"
gogo[gnl]="GNL:$GH_USER/at42GNL"
gogo[printf]="ft_printf:$GH_USER/at42printf"
gogo[cub3D]="cub3D:$GH_USER/at42cub3D"
gogo[bootcamp_py]="bootcamp_py:$GH_USER/python_bootcamp"
gogo[server]="ft_server:$GH_USER/at42ft_server"
gogo[exams]="exams:$GH_USER/exams"
gogo[asm]="libasm:$GH_USER/at42libasm"
gogo[minishell]="minishell:$GH_USER/at42minishell"
gogo[services]="ft_services:$GH_USER/at42ft_services"
gogo[cpp]="cpp-piscine:$GH_USER/cpp-piscine"
gogo[philo]="philosophers:$GH_USER/at42Philosophers"
gogo[kscrap]="kscrap:"
gogo[containers]="ft_containers:$GH_USER/at42ft_containers"
gogo[codinGame]="codinGame:"
gogo[ghsite]="ghsite:$GH_USER/$GH_USER.github.io"
gogo[resume]="resume:"
gogo[webserv]="webserv:lobbyra/webserv"
gogo[transcendence]="ft_transcendence:$GH_USER/ft_transcendence"
gogo[push_swap]="push_swap:$GH_USER/at42push_swap"

for key value in ${(kv)gogo}; do
	localpath="$projectsdir/$(echo $value | cut -d ':' -f 1)"
	remotepath=$(echo $value | cut -d ':' -f 2)

	eval \
	"function gogo_$key () {
		cd $localpath && return;
		[ -z '$remotepath' ] && return 1;
		echo -n 'Do you want to clone ? (y/n): ' && read -k 1 choice; echo ''
		if [ \$choice = 'y' ]; then
			git clone https://$GH_USER@github.com/$remotepath $localpath
			cd $localpath
		else
			echo 'Okay as you want, I am not cloning!'
		fi
	}"
done

unset gogo localpath remotepath GH_USER

alias thp="cd $projectsdir/THP"
alias doruby="cd $projectsdir/THP_rendu"
alias dobot="cd $projectsdir/MeandreBot"

going=""
if [ -n "$going" ] && ! env | grep "VSCODE" &>/dev/null; then
	eval gogo_$going
fi
unset going
