Suppose you want to build a project and you want to install build dependencies just for
now to build, not forever. Use this script and these will be removed with the next
(sudo)`apt autoremove`.

I use it for build dependencies, when I want to build a project and not return to it (something
from github or from source).
If it's a long time project, I would want to clean up automatically installed packages and
not reinstall my build dependencies, so this wouldn't be convenient. I'd keep them marked
as manually installed.

## Installation
Clone this repository somewhere you'll keep it. And then run from the directory of the repository
```bash
echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.bashrc
echo "source \"$(pwd)/depinstall-completion.bash\"" >> ~/.bashrc
```
