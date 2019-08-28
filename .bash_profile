# Aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias la="ls -a"
alias ll="ls -la"
alias lt="ls -t"
alias up="cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias grep="grep --color=auto"
alias undo="cd -"
alias pping="ping github.com"
alias weather='curl wttr.in/boston'

# Docker commands
alias dockernuke='docker images -q | xargs docker rmi -f'
alias dockerprune='docker system prune && docker volume prune'
alias dls="docker image ls"

# COLOURS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PS1="\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
#export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export LSCOLORS=GxFxCxDxBxegedabagaced

# PHP linting functions
codesniff() {
  txtred=$(tput setaf 1) # Red
  txtrst=$(tput sgr0)    # Text Reset
  if [ -f phpcs.xml ]
  then
    if [ $# -eq 0 ]
    then
      phpcs -d memory_limit=-1 --encoding=utf-8 --standard=phpcs.xml .
    else
      phpcs -d memory_limit=-1 --encoding=utf-8 --standard=phpcs.xml "$@"
    fi
  else
    printf "%40s\n" "${txtred}Error: Could not find phpcs.xml${txtrst}"
  fi
}

messdetect() {
  txtred=$(tput setaf 1) # Red
  txtrst=$(tput sgr0)    # Text Reset
  if [ -f codesize.xml ]
  then
    if [ $# -eq 0 ]
    then
      phpmd . text codesize.xml
    elif [ $# -gt 1 ]
    then
      printf "%40s\n" "${txtred}Error: Can only support either a single file, directory, or no arguments to do the entire current directory${txtrst}"
    else
      phpmd "$@" text codesize.xml
    fi
  else
    printf "%40s\n" "${txtred}Error: Could not find codesize.xml${txtrst}"
  fi
}

# Show working directory as tab title in iterm
if [ $ITERM_SESSION_ID ]; then
  #export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
  export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'
fi

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# Gitprompt setup
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Bash tab-completion setup
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Add composer to path
export PATH="$HOME/.composer/vendor/bin:$PATH"


