#!/bin/sh
#Bootstraps vim-plug and installs all plugins

PLUGINCONFIG="$(pwd)/plugins.vim";

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -u $PLUGINCONFIG +PlugInstall +qall
ln -s $PLUGINCONFIG ~/.vimrc.plugins
