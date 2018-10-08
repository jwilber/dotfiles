#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# .bashrc additions
ln -s "$DIR/bash/.bashrc" "$HOME/.bashrc.local"
ln -s "$DIR/bash/.aliases" "$HOME/.aliases"
ln -s "$DIR/bash/.functions" "$HOME/.functions"
echo "source $HOME/.bashrc.local" >> "$HOME/.bashrc"

# create backup files so no loss if overwrite
if [ -e "$HOME/.vimrc" ]; then mv "$HOME/.vimrc" "$HOME/.vimrc.bkp"; fi
if [ -e "$HOME/.vim" ]; then mv "$HOME/.vim" "$HOME/.vim.bkp"; fi

ln -s "$DIR/vim/vimrc.symlink" ~/.vimrc
ln -s "$DIR/vim/vim.symlink/" ~/.vim

# .gitconfig
ln -s "$DIR/.gitconfig" "$HOME/.gitconfig"

# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    echo "Install homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Skipping homebrew. Already installed..."
fi

# tree
    which -s tree
    if [[ $? != 0 ]] ; then
        echo "Installing tree..."
        brew install tree
    else
        echo "Skipping tree. Already installed..."
fi

# ripgrep
    which -s rg
    if [[ $? != 0 ]] ; then
        echo "Installing ripgrep..."
        brew install ripgrep
    else
        echo "Skipping ripgrep. Already installed..."
fi

# sublime text (I still like for intensive copy&paste stuff)
    which -s sublime
    if [[ $? != 0 ]] ; then
        echo "Installing sublime-text3..."
        brew cask install sublime-text3
    else
        echo "Skipping sublime-text3. Already installed..."
fi


