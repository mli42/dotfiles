# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_things.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/09 17:45:28 by mli               #+#    #+#              #
#    Updated: 2020/05/09 18:32:03 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

function install_42toolbox () {
	git clone https://github.com/alexandregv/42toolbox.git ~/
}

# python -V ==> 3.7
# When the installation is done rerun the set_conda function.
function set_conda {
	HOME=$(echo ~)
	INSTALL_PATH="/goinfre"
	MINICONDA_PATH=$INSTALL_PATH"/miniconda3/bin"
	PYTHON_PATH=$(which python)
	SCRIPT="Miniconda3-latest-MacOSX-x86_64.sh"
	REQUIREMENTS="jupyter numpy pandas"
	DL_LINK="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh"
	if echo $PYTHON_PATH | grep -q $INSTALL_PATH; then
		echo "good python version :)"
	else
		cd
		if [ ! -f $SCRIPT ]; then
			curl -LO $DL_LINK
		fi
		if [ ! -d $MINICONDA_PATH ]; then
			sh $SCRIPT -b -p $INSTALL_PATH"/miniconda3"
		fi
		conda install -y $(echo $REQUIREMENTS)
		clear
		echo "Which python:"
		which python
		if grep -q "^export PATH=$MINICONDA_PATH" ~/.zshrc
		then
			echo "export already in .zshrc";
		else
			echo "adding export to .zshrc ...";
			echo "export PATH=$MINICONDA_PATH:$PATH" >> ~/.zshrc
		fi
		source ~/.zshrc
	fi
}

function vesk {
	read input
	echo "This is your input : [$input] !"
}
