#!/usr/bin/python
"""Sets up my dotfiles"""

from string import Template
import os

PATHS = dict({'emacs':'${HOME}/.emacs', 
              'vimrc':'${HOME}/.vimrc',
              'zshrc':'${HOME}/.zshrc',
              'Xdefaults':'${HOME}/.Xdefaults',
              'xmonad':'${HOME}/.xmonad',
              'screenrc':'${HOME}/.screenrc',
              'elisp':'${HOME}/elisp'})

def setup_paths():
  """Creates symlinks"""
  for origin, destination in PATHS.items():
    home = os.environ['HOME']
    dest_real = Template(destination).substitute(HOME=home)
    if(os.path.lexists(dest_real)):
      backup_path = dest_real + ".orig"
      os.rename(dest_real, backup_path)
      print dest_real + " already exists, backing up to " + backup_path
    print origin + " => " + dest_real
    os.symlink(os.path.realpath(origin), dest_real)


def setup_oh_my_zsh():
  """Setup oh-my-zsh"""
  os.system("curl -L https://github.com/dietrichf/oh-my-zsh/raw/master/tools/install.sh | sh")

if __name__ == "__main__":
  setup_oh_my_zsh()
  setup_paths()
