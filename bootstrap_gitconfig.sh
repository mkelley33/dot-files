#! /bin/sh

# Must source zshrc before executing this file

ln -s $DOTS/bootstrap_gitconfig.sh .bootstrap_gitconfig.sh
# aliases managed by git .aliases file and zsh git plugin

git config --global user.name $USER_FULL_NAME
git config --global user.email $USER_EMAIL

git config --global merge.stat true
git config --global diff.mnemonicprefix true
git config --global branch.autosetupmerge true
git config --global push.default tracking
git config --global rerere.enabled true

git config --global core.editor code
git config --global core.excludesfile ~/.gitignore
git config --global core.whitespace trailing-space,space-before-tab

git config --global color.ui auto

git config --global advice.pushNonFastForward false
git config --global advice.statusHints false
