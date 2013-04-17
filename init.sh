DOTBASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# git prompt stuff
GIT_PS1_SHOWUPSTREAM="git"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
. $DOTBASE/git-prompt.sh

PROMPT_COMMAND='es=$?'
PS1="\$( if [[ \$es == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\$es\"; fi ) \[\033[01;36m\]\$PROMPTHOST:\[\033[01;35m\]\W\[\e[0;33;49m\]\$(__git_ps1)\[\e[0;0m\]$ "

gitvars() {
  export author="$(git log --format='%an <%ae>' HEAD -n1)"
  export hash="$(git log --format='%H' HEAD -n1)"
  echo "\$author=\"$author\""
  echo "\$hash=\"$hash\""
}

function c { pygmentize -O style=monokai -f console256 -g $1 | less -RN; }
