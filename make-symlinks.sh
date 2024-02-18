#!/bin/zsh


if [[ ! ${+DOTS} ]]; then
  echo 'The DOTS variable must be set to the absolute path where your dotfiles repo is located.'
  return
fi

# Don't allow this script to run in its own directory,
# because we don't want it to alter the dotfiles that
# were cloned.  Instead, this should be run from
# somewhere like HOME for example.
if [ $PWD = $DOTS ]; then
  echo 'This script cannot be run in the same directory as'
  echo 'the one specified by DOTS in zshrc.\n\n'
  echo 'First cd into another directory, then'
  echo 'Run this script like so:\n\n source $DOTS/make_symlinks.sh\n'
  return
fi

dotfiles=(".zshrc" ".zprofile" ".gitignore_global" ".p10k.zsh")

echo "\n"
for dotfile in "${dotfiles[@]}"
do
  if [ -L ${dotfile} ]; then
    echo "Not created: symlink ${dotfile} already exists!"
    vared -p "Unlink symlink ${dotfile}?" -c REPLY
    if [[ ${REPLY} = "yes" ]]; then
      echo "Removing symlink ${dotfile}..."
      unlink ${dotfile}
    fi
    continue
  elif [ -f ${dotfile} ]; then
    dotfile_old="${dotfile}.`date +%m%d%y-%H-%M-%S`"
    echo "File: ${dotfile} already exists!\n"
    echo "Renaming to ${dotfile_old}"
    mv $dotfile $dotfile_old
  fi
  echo "Creating ${dotfile} symlink\n"
  ln -s $DOTS/$dotfile
done
echo "\n"
