#!/bin/sh
echo "[setup.sh] Running danielgoh's dev environment setup"

# Install Vim
echo "[setup.sh] Locating/Installing Vim"
if [ -f "$(command -v vim)" ]
then
  echo "[setup.sh] Vim already installed, upgrading to latest version"
else
  echo "[setup.sh] Cannot find path to Vim, installing Vim"
  sudo apt-get update && sudo apt-get install vim
fi

echo "[setup.sh] Copying vim configurations"
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

echo "[setup.sh] Creating necessary swap and backup folders for vim"
mkdir ~/.vim/swap
mkdir ~/.vim/backup
mkdir ~/.vim/undo

echo "[setup.sh] Installing vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall! +qall

echo "[setup.sh] Installing ag silver_searcher for fuzzy finding"
if [ !-f "$(command -v Vim)" ]
then
  sudo apt-get update && sudo apt-get install silversearcher-ag
fi
