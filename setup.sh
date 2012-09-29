#!/usr/bin/env zsh

REPO=http://github.com/nudded/dotfiles
DEST="$HOME/.dotfiles"

if [[ -d $DEST ]];then
  cd $DEST && git pull origin master && cd -
else
  echo "cloning repo: $REPO into dir: $DEST"
  git clone $REPO $DEST
fi

function setup() {
    SRC="$1"
    DST="$2"
    echo "Installing $SRC..."

    mkdir -p $(dirname "$DST")
    ln -sfn "$DEST/$SRC" "$DST"
}

echo "Setting up Vundle"
if [[ -d $HOME/.vim/bundle/vundle ]]; then
  echo "Vundle already installed"
else
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

echo "Creating tmp dirs in .vim"
mkdir -p $HOME/.vim/tmp/{backup,swap}

setup vimrc "$HOME/.vimrc"
setup zshrc "$HOME/.zshrc"
setup tmux.conf "$HOME/.tmux.conf"
setup gitconfig "$HOME/.gitconfig"


echo "Cloning tmux-powerline into ~/.tmux"
rm -rf ~/.tmux/powerline
mkdir -p ~/.tmux/powerline
git clone http://github.com/nudded/tmux-powerline ~/.tmux/powerline

echo "updating Bundles"
vim +BundleInstall! +qall

reset
