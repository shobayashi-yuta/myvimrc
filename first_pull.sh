#!/bin/sh
cd ~/
if [ "$(uname)" == 'Darwin' ]; then
	OS='Mac'
	pull_vimrc_mac.sh
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	OS='Linux'
	sh pull_vimrc.sh
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
	OS='Cygwin'
else
	echo "Your platform ($(uname -a)) is not supported."
	exit 1
fi
rm -rf .vim/bundle/
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
vim
