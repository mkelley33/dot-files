# dot-files

My latest dot files and some that I've discovered.

To auto-create symlinks to the dotfiles in this repo, run:

```
source ~/projects/dot-files/make-symlinks.sh
```

The path to where you cloned the repo may differ, so update the above path to make-symlinks.sh as needed.

First make a backup of your .gitconfig, if you have one. Then, to create a global gitconfig
(only tested on Mac OS, Sonoma):

```
source ~/projects/dot-files/bootstrap-gitconfig.sh
```
