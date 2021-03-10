projectsdir="~/Desktop/Projects/"
alias gogo_desk="cd ~/Desktop"

# Creating associative array
declare -A gogo

gogo[projects]="";
gogo[fac]="Python_Fac"
gogo[working_on]="working_on"
gogo[libft]="libft"
gogo[gnl]="GNL"
gogo[printf]="ft_printf"
gogo[cub3D]="cub3D"
gogo[bootcamp_py]="bootcamp_py"
gogo[server]="ft_server"
gogo[exams]="exams/exam05"
gogo[asm]="libasm"
gogo[minishell]="charmstr"
gogo[services]="ft_services"
gogo[cpp]="cpp-piscine"
gogo[philo]="philosophers"
gogo[kscrap]="kscrap"
gogo[containers]="ft_containers"
gogo[codinGame]="codinGame"
gogo[ghsite]="ghsite"
gogo[resume]="resume"
gogo[webserv]="webserv"

for key in ${(k)gogo}; do
	eval "alias gogo_$key=\"cd $projectsdir/$gogo[$key]\""
done

unset gogo

alias thp="cd $projectsdir/THP"
alias doruby="cd $projectsdir/THP_rendu"
alias dobot="cd $projectsdir/MeandreBot"

going=""
if [ -n "$going" ] && ! env | grep "VSCODE" &>/dev/null; then
	eval gogo_$going
fi
unset going
