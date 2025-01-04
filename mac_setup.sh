# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install stuff
brew install \
    tree \
    gh \
    ripgrep \
    glow \
    scc \
    node \ # ew # NOTE: might actually need node@22 :/
    yarn \ # ew
    just \
    tmux \
    nvim

# TODO: copy over dotfiles and whatnot
