#!/bin/sh
echo "[setup.sh] Running danielgoh's dev environment setup"

# Install Vim
echo "[setup.sh] Locating/Installing Vim"
if [ -f "$(command -v vim)" ]
then
  echo "[setup.sh] Vim already installed, upgrading to latest version"
  brew upgrade vim
else
  echo "[setup.sh] Cannot find path to Vim, installing Vim"
  brew install vim
fi

echo "[setup.sh] Copying vim configurations"
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

echo "[setup.sh] Creating necessary swap and backup folders for vim"
mkdir ~/.vim/swap
mkdir ~/.vim/backup
mkdir ~/.vim/undo

echo "[setup.sh] Installing vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall! +CocInstall coc-json coc-tsserver +qall

echo "[setup.sh] Installing ag silver_searcher for fuzzy finding"
if [ !-f "$(command -v Vim)" ]
then
  brew install the_silver_searcher
fi
