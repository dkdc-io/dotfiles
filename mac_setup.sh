# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# install uv tools
uv tool install ruff
uv tool install dkdc --python 3.12

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install stuff
brew install --cask rectangle
brew install \
    tree \
    gh \
    jq \
    ripgrep \
    glow \
    scc \
    btop \
    go \
    rust \
    rustup \
    rust-analyzer \
    lua-language-server \
    stylua \
    node \ # ew # NOTE: might actually need node@22 :/
    yarn \ # ew
    just \
    tmux \
    nvim

# npm nonsense
npm install -g pyright # needed for extra things

# go stuff
go install golang.org/x/tools/gopls@latest # go lsp

# rust stuff

# TODO: copy over dotfiles and whatnot
# TODO: clone nvim stuff
