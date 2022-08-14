#!/bin/sh

DOTFILES_DIR=$(cd `dirname $0` && pwd)

function brew_install {
  brew install --quiet $1
}

# https://brew.sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL \
  https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

# http://tmux.github.io
brew_install tmux
ln -f -s $DOTFILES_DIR/tmux.conf ~/.tmux.conf
brew_install reattach-to-user-namespace

# https://zsh.org
brew_install zsh
brew_install zsh-autosuggestions
brew_install zsh-syntax-highlighting

# https://starship.rs
brew_install starship
mkdir -p ~/.config && ln -f -s $DOTFILES_DIR/starship.toml ~/.config/starship.toml

# font from https://www.nerdfonts.com
brew tap homebrew/cask-fonts
brew_install font-fira-code-nerd-font

# https://neovim.io
brew_install neovim
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config && ln -f -s $DOTFILES_DIR/nvim ~/.config/

# https://bazel.build
brew_install bazelisk
brew tap bazelbuild/tap
brew_install bazelbuild/tap/ibazel

# https://github.com/sharkdp/bat
brew_install bat

# http://golang.org
brew_install go

# http://rust-lang.org
brew_install rust

# https://github.com/junegunn/fzf
brew_install fzf
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
