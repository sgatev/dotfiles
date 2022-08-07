#!/bin/sh

DOTFILES_DIR=$(cd `dirname $0` && pwd)

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# http://tmux.github.io
brew install --quiet tmux
ln -f -s $DOTFILES_DIR/tmux.conf ~/.tmux.conf
brew install --quiet reattach-to-user-namespace

# https://zsh.org
brew install --quiet zsh
brew install --quiet zsh-autosuggestions

# https://starship.rs
brew install --quiet starship
mkdir -p ~/.config && ln -f -s $DOTFILES_DIR/starship.toml ~/.config/starship.toml

# font from https://www.nerdfonts.com
brew tap homebrew/cask-fonts
brew install --cask --quiet font-fira-code-nerd-font

# https://neovim.io
brew install --quiet neovim
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config && ln -f -s $DOTFILES_DIR/nvim ~/.config/

# https://bazel.build
brew install bazelisk
brew tap bazelbuild/tap
brew install bazelbuild/tap/ibazel
