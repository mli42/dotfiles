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
gogo[exams]="exams/exam04"
gogo[asm]="libasm"
gogo[minishell]="charmstr"
gogo[services]="ft_services"
gogo[cpp]="cpp-piscine"
gogo[philo]="philosophers"

for key in ${(k)gogo}; do
	eval "alias gogo_$key=\"cd $projectsdir/$gogo[$key]\""
done

unset gogo

alias thp="cd $projectsdir/THP"
alias doruby="cd $projectsdir/THP_rendu"
alias dobot="cd $projectsdir/MeandreBot"

# gogo_projects
