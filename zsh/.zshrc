#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias py="python3"
alias eb="einkbear"
alias ebs="einkbear shell"
alias bb="brazil-build"
alias bbe="brazil-build --platform eink"
#export EDITOR=vim
export PATH="$HOME/.toolbox/bin:$PATH"
export PATH="/apollo/env/SDETools/bin:$PATH"
# Customize to your needs...
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# set -o vi
bindkey "^R" history-incremental-search-backward
