#!/bin/sh
echo "[setup.sh] Running danielgoh's dev environment setup"

# Install Vim
echo "[setup.sh] Locating/Installing Vim"
if [ -f "$(command -v Vim)" ]
then
  echo "[setup.sh] Vim already installed, upgrading to latest version"
  brew upgrade vim
else
  echo "[setup.sh] Cannot find path to Vim, installing Vim"
  brew install vim
fi

echo "[setup.sh] Copying vim configurations"
cp ./vim/.vimrc ~/

echo "[setup.sh] Installing vim plugins"
vim +PluginInstall! +qall

echo "[setup.sh] Installing ag silver_searcher for fuzzy finding"
brew install the_silver_searcher
