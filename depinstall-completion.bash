#/usr/bin/bash

# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial
# https://unix.stackexchange.com/a/4220

function _depinstall_completions()
{
  ((COMP_CWORD+=1))
  # Quotes here are important
  COMP_WORDS=( apt-get install "${COMP_WORDS[@]:1}" )
  _apt_get
  return 0
}

complete -F _depinstall_completions depinstall
