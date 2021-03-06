export DOTBASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# -X doesn't clear screen on quit, -r keeps ascii codes
export LESS=-Xr

# git prompt stuff
GIT_PS1_SHOWUPSTREAM="git"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
. $DOTBASE/git-prompt.sh
. $DOTBASE/git-completion.bash

PROMPT_COMMAND='es=$?'
UC="\[\033[0;36m\]"    # user's color
[ $UID -eq "0" ] && UC="\[\033[0;31m\]" # root's color
PS1="\$( if [[ \$es == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\$es\"; fi ) $(echo $UC)\u@\$PROMPTHOST:\[\033[01;35m\]\W\[\e[0;33;49m\]\$(__git_ps1)\[\e[0;0m\]\\$ "

gitvars() {
  export author="$(git log --format='%an <%ae>' HEAD -n1)"
  export hash="$(git log --format='%H' HEAD -n1)"
  echo "\$author=\"$author\""
  echo "\$hash=\"$hash\""
}

su() {
  user=$( [[ -n $1 ]] && echo "-u $1" )
  profile=$HOME/.bash_profile
  sudo $user bash --rcfile $profile -i
}

function c { pygmentize -O style=monokai -f console256 -g $1 | less -RN; }
