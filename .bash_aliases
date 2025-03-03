# exports

#export PATH="/usr/bin:$PATH" # ???

#export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH" # code
#export PATH="/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin:$PATH" # code

export PATH="$HOME/.local/bin:$PATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
else
    export PATH="$HOME/.linuxbrew/bin:$PATH"
fi

export PATH="$HOME/go/bin:$PATH" # go stuff
export PATH="$HOME/.cargo/bin:$PATH" # rust stuff
  
## newer work stuff
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/shims ]] && export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

# export other stuff
export PYTHONDONTWRITEBYTECODE=1
export OLLAMA_HOME="$HOME/.ollama"

# fine
export EDITOR="nvim"

# common typo
alias dkcd="dkdc"

# dkdc
alias dk="dkdc"
alias dc="dkdc"
alias dkdcio="cd ~/code/dkdc-io"
alias dio="dkdcio"

# codai
alias codia="codai"
alias ai="codai"

# ascend
alias ascendio="cd ~/code/ascend-io"
alias aio="ascendio"

# other
alias code="cd ~/code"
alias data="cd ~/data"
alias profiles="cd ~/profiles"
alias secrets="cd ~/secrets"

# mac
alias down="cd ~/Downloads"
alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"

# time savers 
#alias vim="nvim"
alias v="nvim"
alias vt='v -c "T"'
alias vi="nvim"
alias m="tmux"
alias l="less"
alias tree="tree -I venv -I .git -I"
alias t="tree -FC"
alias tl="tree -L 1 -FC"
alias tt="tree -L 2 -FC"
alias ttt="tree -L 3 -FC"
alias tttt="tree -L 4 -FC"
function ls() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        command ls -1GhFA "$@"
    else
        command ls -1 --color=auto -hFA "$@"
    fi
}
alias lsl="ls -l"
alias gs="git status"
alias gn="git checkout -b" 
alias gm="git checkout main"
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
alias git400="git config http.postBuffer 524288000"
alias diff="git diff --color-words --no-index"
alias ghpra="gh pr list --state all"
alias grep='rg --hidden --glob "!.env" --glob "!.git"'
alias g="grep"
alias gi="grep -i"
alias top="btop"
alias du="du -h -d1"
alias loc="scc"
alias find="find . -name"
alias f="find"
alias glow="glow -p"
alias preview="glow"
alias p="glow"

## server things
alias rsync="rsync -av --exclude-from='.gitignore'"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# quick mafs 
alias ali="v ~/.bash_aliases"
update() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        . ~/.zprofile
    else
        . ~/.bashrc
    fi
    git config --global core.excludesfile ~/.gitignore
}
alias gitignore="v ~/.gitignore"
alias vimrc="v ~/.config/nvim/init.lua"
alias tmuxc="v ~/.tmux.conf"
alias ipyrc="v ~/.ipython/profile_default/ipython_config.py"

# work
alias dotfiles="cd ~/code/dkdc-io/dotfiles"
alias files="cd ~/code/dkdc-io/files"
alias pfiles="cd ~/code/dkdc-io/public_files"
alias product="cd ~/code/ascend-io/product"
alias afiles="cd ~/code/ascend-io/product/website"
alias cnotes="v ~/code/ascend-io/product/website/docs/notes/customer-meetings.md"
alias drafts="cd ~/code/ascend-io/product/website/docs/drafts"
alias pri="v ~/code/dkdc-io/files/pri.md"
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
alias dev="ipy -i dev.py"

alias di="uv pip install --upgrade ipython ipykernel nbformat"

alias wp="which python"
alias wp3="which python3"

alias venv="uv venv"
alias on=". .venv/bin/activate"
alias off="deactivate"

# gitfucked
function gitfucked() {
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

# draw
function excalidraw() {
    (cd ~/code/excalidraw && yarn start)
}
alias draw="excalidraw"

# eval "$(pyenv init -sh)"
export PYTHONBREAKPOINT="IPython.embed"
