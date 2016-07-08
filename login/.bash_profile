[[ -s ~/.bashrc ]] && source ~/.bashrc

[[ -s ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh

export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
alias ll='ls -l'


function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  local VENV="\$(virtualenv_info)";

  export PS1="\n$CYANBOLD$VENV$RED\u $PURPLE@ $BLUE\h $GREEN\w $RESETCOLOR$GREENBOLD\$(git rev-parse --abbrev-ref HEAD 2> /dev/null)\n $BLUE[\#] → $RESETCOLOR"
  export PS2=" | → $RESETCOLOR"
}

prompt

PATH=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin:$PATH:/Users/bshetty/bin
PATH="/opt/chefdk/bin:$PATH"
export PATH="$PATH:~/Library/Android/sdk/platform-tools"
export PATH="$PATH:~/Library/Android/sdk/tools"

export NVM_DIR="/Users/bshetty/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
