# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install_things.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/09 17:45:28 by mli               #+#    #+#              #
#    Updated: 2020/08/21 14:47:07 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

function install_42toolbox () {
	git clone https://github.com/alexandregv/42toolbox.git ~/
}

function install_valgrind () {
	brew install --HEAD https://raw.githubusercontent.com/sowson/valgrind/master/valgrind.rb
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

function gitig_init () {
	echo "Creating .gitignore"
	echo ".gitignore" >> .gitignore
	echo "a.out" >> .gitignore
	echo "*.o" >> .gitignore
	echo "*.a" >> .gitignore
	echo ".vscode" >> .gitignore
	echo ".idea" >> .gitignore
	echo "CMake*" >> .gitignore
}

function vesk {
	echo -n "It's tough to read...: "
	read  abc
	echo "This is your input : [$abc] !"
}

function install_brew () {
	# Install BREW 🍺
	if ! which brew &>/dev/null; then
		echo "\t\t\e[1;93mInstall BREW 🍺...\e[0m"
		rm -rf $HOME/.brew &&
		git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew &&
		echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc &&
		source $HOME/.zshrc && brew update
	fi

	if ! which watch &>/dev/null; then
		brew install watch
	fi

	if ! which nodejs &>/dev/null; then
		brew install nodejs
	fi
}
