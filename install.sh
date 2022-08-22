#!/bin/sh

DOTFILES_DIR=$(cd `dirname $0` && pwd)

function brew_install {
  brew install --quiet $1
}

function git_install {
  git -C $2 pull --quiet || git clone --quiet $1 $2
}

# https://brew.sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL \
  https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

# http://tmux.github.io
brew_install tmux
ln -f -s $DOTFILES_DIR/tmux.conf ~/.tmux.conf
brew_install reattach-to-user-namespace
git_install https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# https://zsh.org
brew_install zsh
brew_install zsh-autosuggestions
brew_install zsh-syntax-highlighting
ln -f -s $DOTFILES_DIR/zshrc ~/.zshrc
ln -f -s $DOTFILES_DIR/zsh ~/zsh

# https://github.com/Aloxaf/fzf-tab
git_install https://github.com/Aloxaf/fzf-tab ~/.zsh/plugins/fzf-tab

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
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish > /dev/null

# set up git aliases
git config --global alias.a 'add'
git config --global alias.cam '!git add --all && git commit -m'
git config --global alias.d 'diff'
git config --global alias.d 'diff'
git config --global alias.dc 'diff --cached'
git config --global alias.l 'log --oneline'
git config --global alias.p 'push'
git config --global alias.s 'status -sb'
