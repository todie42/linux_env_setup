# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
if [ -o histappend ]; then
  shopt -s histappend
fi
if [ -o globstar ]; then
  shopt -s globstar
fi


alias ll='ls -alh'
alias lt='ls -larth'

export BC_ENV_ARGS=~/.bc
export HISTIGNORE='up:upp:uppp:upppp:dn:dnn:dnnn:dnnnn:history:ll'
export HISTTIMEFORMAT='%F %T '
export TITLEBAR='\[\e]0;\u@\h:\W\a\]'
export PS1="${TITLEBAR}\[\e[1;32m\]\u@\h \w\n\$\[\e[1;32m\]\[\e[0m\]"

function cd() { builtin cd "$@" && ls -lah; }
alias up='pushd .. >/dev/null; cd .'
alias upp='pushd ../.. >/dev/null; cd .'
alias uppp='pushd ../../.. >/dev/null; cd .'
alias upppp='pushd ../../../.. >/dev/null; cd .'
alias uppppp='pushd ../../../../.. >/dev/null; cd .'

alias dn='popd >/dev/null; cd .'
alias dnn='popd >/dev/null; popd >/dev/null; cd .'
alias dnnn='popd >/dev/null; popd >/dev/null; popd >/dev/null; cd .'
alias dnnnn='popd >/dev/null; popd >/dev/null; popd >/dev/null; popd >/dev/null; cd .'
