# export PATH
#export PATH="/usr/bin:$PATH" # ???

#export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH" # code
#export PATH="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin:$PATH" # code

export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH" # homebrew stuff # TODO: linux?

export PATH="$HOME/go/bin:$PATH" # go stuff
export PATH="$HOME/.cargo/bin:$PATH" # rust stuff

# export other stuff
export OLLAMA_HOME="$HOME/.ollama"

# fine
export EDITOR="nvim"

# common typo
alias dkcd="dkdc"

# dkdc
alias dk="dkdc"
alias dc="dkdc"
alias dkdcio="cd ~/code/dkdc-io"

# ascend
alias ascendio="cd ~/code/ascend-io"

# draw
alias excalidraw="cd ~/code/excalidraw && yarn start"
alias draw="excalidraw"

# time savers 
#alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias m="tmux"
alias l="less"
alias tree="tree -I venv -I .git"
alias t="tree -FC"
alias tl="tree -L 1 -FC"
alias tt="tree -L 2 -FC"
alias ttt="tree -L 3 -FC"
alias ls='ls -1AhFX --group-directories-first --color=auto'
alias lsl="ls -l"
alias gs="git status"
alias gl="git log"
alias gn="git checkout -b" 
alias gb="git branch" 
alias ga="git add ."
alias gA="git add -A"
alias qs="git add . && git commit -m 'qs'"
alias ss="qs"
alias gc="git commit -m"
alias gp="git push"
alias gpf="git push --force"
alias gl="git log"
alias gr="git rebase -i origin/main"
alias diff="git diff --color-words --no-index"
alias grep="rg"
alias top="btop"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# quick mafs 
alias ali="v ~/.bash_aliases"
alias update="source ~/.bashrc && git config --global core.excludesfile ~/.gitignore"
alias gitignore="v ~/.gitignore"
alias vimrc="v ~/.config/nvim/init.lua"
alias tmuxc="v ~/.tmux.conf"
alias ipyrc="v ~/.ipython/profile_default/ipython_config.py"

# make life easier 
alias du="du -h -d1"
alias loc="scc"
alias find="find . -name"
alias glow="glow -p"
alias preview="glow"
alias p="glow"

# work
alias dotfiles="cd ~/code/dkdc-io/dotfiles"
alias files="cd ~/code/dkdc-io/files"
alias pfiles="cd ~/code/dkdc-io/public_files"
alias drafts="cd ~/code/dkdc-io/files/drafts"
alias todo="v ~/code/dkdc-io/files/todo.md"
alias notes="v ~/code/dkdc-io/files/notes.md"

# etc
alias temp="v temp.md"

# python stuff
#alias python="python3"
#alias pip="pip3"
alias ipython="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy="ipython"
alias eda="ipy -i eda.py"

alias di="uv pip install --upgrade neovim ipython ipykernel nbformat pip"

alias wp="which python"
alias wp3="which python3"

alias venv="uv venv"
alias on=". .venv/bin/activate"
alias off="deactivate"

gitfucked() {
    repo_name=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)")
    if [ -z "$repo_name" ]; then
        echo "not in a git repository"
        return 1
    fi

    for i in {1..3}; do
        echo -n "are you sure you want to nuke the repo '$repo_name' at $(pwd)? [Y/N] "
        read response
        if [[ ! "$response" =~ ^[Y]$ ]]; then
            echo "operation cancelled"
            return 1
        fi
    done

    git update-ref -d HEAD && git add -A && git commit -m "initial commit" && git push --force
    echo "repository '$repo_name' has been reset"
}

export PYTHONDONTWRITEBYTECODE=1

