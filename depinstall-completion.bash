#/usr/bin/bash

# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial
# https://unix.stackexchange.com/a/4220

# This forum page is referenced at stackexchange thread above,
#   also says how to obtain completion function name.
#   https://ubuntuforums.org/showthread.php?t=733397

# apt-get completion function is defined only
#   when completion is requested.
#   These guides also show how to load the
#   completion function: call
#   _completion_loader.
#   https://stackoverflow.com/q/15858271
_completion_loader apt-get

# Make sure the name is _apt_get
#   I wanted to obtain the name dynamically,
#   but completion may be static, not dynamic.
#   The first link (iridakos.com/programming)
#   shows that. To not parse bash command,
#   seems unreliable, I'll just use the
#   output to check that completion
#   is just dynamic and calls _apt_get.
if [ "$(complete -p apt-get)" != "complete -F _apt_get apt-get" ]; then
  echo "depinstall: apt-get completion function name has changed. Please, update depinstall or uninstall it's autocompletion (delete the line with word depinstall-completion.bash from .bashrc)."
else
  function _depinstall_completions()
  {
    ((COMP_CWORD+=1))
    # Quotes here are important
    COMP_WORDS=( apt-get install "${COMP_WORDS[@]:1}" )
    _apt_get
    return 0
  }

  complete -F _depinstall_completions depinstall
fi
