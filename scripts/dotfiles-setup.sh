#!/bin/bash

cp -r ~/dotfiles/.* ~
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
