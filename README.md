__Depinstall is a script for ubuntu__

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
if [ -f ./depinstall ]; then
  echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.bashrc
  echo "source \"$(pwd)/depinstall-completion.bash\"" >> ~/.bashrc
fi
```

Just copy this and paste into the terminal, press Enter.

Sometimes packages you install may be "suggested" by other packages you already have in your system. Then `apt autoremove` won't think they are unused. Because they are used, for some additional functionality in other programs. I recommend to use `depremove` for uninstallation, it should handle these cases.

**Warning: you should not run two instances of depinstall/depremove at the same time from different users. It's not supported. The code of depinstall and depremove assumes there's other depinstalls, depremoves and apt jobs, while it's working.**

Regarding apt jobs, it's sufficient that there are no apt-get jobs until installation/uninstallation stage. If there's an apt job at these points, apt-get will just fail to take the lock. And there will be no changes to your computer environment.
