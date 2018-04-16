if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'

export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:/Applications/MacVim.app/Contents/bin
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# export PS1="${BLUE}[\u] ${NC}\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PS1="\033[1;34m\][\u] ${NC}\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias rubyctags="ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)"
alias rakedb="rake db:drop db:create db:migrate db:seed"
