#!/usr/bin/env bash

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

function brew_install {
  brew install --quiet $1
}

function git_install {
  git -C $2 pull --quiet || git clone --quiet $1 $2
}

DOTFILES="$(cd `dirname $0` && pwd)"
ln -f -h -s $DOTFILES ~/.dotfiles

# https://sw.kovidgoyal.net/kitty
brew_install kitty
mkdir -p ~/.config/kitty && ln -f -s $DOTFILES/kitty.conf ~/.config/kitty/kitty.conf

# http://tmux.github.io
brew_install tmux
ln -f -s $DOTFILES/tmux.conf ~/.tmux.conf
git_install https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# https://zsh.org
brew_install zsh
brew_install zsh-autosuggestions
brew_install zsh-syntax-highlighting
ln -f -s $DOTFILES/zshrc ~/.zshrc

# https://github.com/Aloxaf/fzf-tab
git_install https://github.com/Aloxaf/fzf-tab ~/.zsh/plugins/fzf-tab

# https://www.nerdfonts.com
brew_install font-fira-code-nerd-font

# https://neovim.io
brew_install neovim
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config && ln -f -s $DOTFILES/nvim ~/.config/

# https://bazel.build
brew_install bazelisk
brew tap bazelbuild/tap
brew_install bazelbuild/tap/ibazel

# https://github.com/sharkdp/bat
brew_install bat

# http://golang.org
brew_install go

# http://rust-lang.org
brew_install rustup
rustup-init -y -q
brew_install rust-analyzer

# https://github.com/junegunn/fzf
brew_install fzf
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish > /dev/null

# https://github.com/Wilfred/difftastic
brew_install difftastic

# Set up git.
ln -f -s $DOTFILES/gitconfig ~/.gitconfig

# https://github.com/fabianishere/pam_reattach
brew_install pam-reattach

# https://github.com/BurntSushi/ripgrep
brew_install ripgrep

# https://github.com/sharkdp/fd
brew_install fd

# https://clang.llvm.org/docs/ClangFormat.html
brew_install clang-format

# https://github.com/tldr-pages/tldr
brew_install tlrc

# Install neovim plugins.
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 2> /dev/null
