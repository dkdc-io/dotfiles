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
export PATH="$HOME/code/ascend-io/source/bin:$PATH"

# export other stuff
export PYTHONDONTWRITEBYTECODE=1
export OLLAMA_HOME="$HOME/.ollama"

# fine
export EDITOR="nvim"

# mroe work stuff
kpr () 
{ 
    kubectl get pod -L ascend.io/runtime-id -L ascend.io/runtime-kind -L ascend.io/environment-id $@
}

kpro () 
{ 
    kubectl get pod -L ascend.io/runtime-id -L ascend.io/runtime-kind -L ascend.io/environment-id -n ottos-expeditions $@
}

fr () {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: fr <old_text> <new_text>"
    return 1
  fi
  command find . -type f -exec grep -I -l "$1" {} \; | LC_ALL=C xargs sed -i '' 's/'"$1"'/'"$2"'/g'
}

# common typo
function dkcd() {
  dkdc "$@"
}

# dkdc
function dk() {
  dkdc "$@"
}

function dc() {
  dkdc "$@"
}

function dkdcio() {
  cd ~/code/dkdc-io
}

function dio() {
  dkdcio
}

# o
function o() {
  dkdc "$@"
}

# codai
function codia() {
  codai "$@"
}

function ai() {
  codai "$@"
}

# ascend
function ascendio() {
  cd ~/code/ascend-io
}

function aio() {
  ascendio
}

# other
#function code() {
#  cd ~/code
#}

function data() {
  cd ~/data
}

function profiles() {
  cd ~/profiles
}

function secrets() {
  cd ~/secrets
}

function vaults() {
  cd ~/vaults
}

# mac
function down() {
  cd ~/Downloads
}

function desk() {
  cd ~/Desktop
}

function docs() {
  cd ~/Documents
}

# time savers 
#alias vim="nvim"
function v() {
  nvim "$@"
}

function vt() {
  v -c "T" "$@"
}

function vi() {
  nvim "$@"
}

function m() {
  tmux "$@"
}

function l() {
  less "$@"
}

function tree() {
  command tree -F -I venv -I .git -I target -I dist -I target -I ascend-out "$@"
}

function t() {
  command tree -F -I venv -I .git -I target -I dist -I target -I ascend-out "$@"
}

function tl() {
  command tree -L 1 -F -I venv -I .git -I target -I dist -I target -I ascend-out "$@"
}

function tt() {
  command tree -L 2 -F -I venv -I .git -I target -I dist -I target -I ascend-out "$@"
}

function ttt() {
  command tree -L 3 -F -I venv -I .git -I target -I dist -I target -I ascend-out "$@"
}

function tttt() {
  command tree -L 4 -F -I venv -I .git -I target -I dist -I target -I ascend-out "$@"
}

function ls() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        command ls -1GhFA "$@"
    else
        command ls -1 --color=auto -hFA "$@"
    fi
}

function lsl() {
  ls -l "$@"
}

function gs() {
  git status "$@"
}

function gw() {
  git switch "$@"
}

function gn() {
  git switch -c "$@"
}

function gm() {
  git switch main
}

function gb() {
  git branch "$@"
}

function ga() {
  git add .
}

function gA() {
  git add -A
}

function qs() {
  git add . && git commit -m 'qs'
}

function ss() {
  qs
}

function gc() {
  git commit -m "$@"
}

function gp() {
  git push "$@"
}

function gpf() {
  git push --force "$@"
}

function gl() {
  git log "$@"
}

function gr() {
  git rebase -i origin/main "$@"
}

function git400() {
  git config http.postBuffer 524288000
}

function diff() {
  git diff --color-words --no-index "$@"
}

function ghpra() {
  gh pr list --state all "$@"
}

function grep() {
  rg --hidden --glob "!.env" --glob "!.git" --glob "!dist" --glob "!target" --glob "!ascend-out" "$@"
}

function g() {
  grep "$@"
}

function gi() {
  grep -i "$@"
}

function top() {
  btop "$@"
}

function du() {
  command du -h -d1 "$@"
}

function loc() {
  scc "$@"
}

function find() {
  command find . -name "$@"
}

function f() {
  find "$@"
}

function glow() {
  command glow -p "$@"
}

function preview() {
  glow "$@"
}

function p() {
  glow "$@"
}

## server things
function rsync() {
  command rsync -av --exclude-from='.gitignore' "$@"
}

# navigation
function ..() {
  cd ..
}

function ...() {
  cd ../..
}

function ....() {
  cd ../../..
}

# quick mafs 
function ali() {
  v ~/.bash_aliases
}

update() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        . ~/.zprofile
    else
        . ~/.bashrc
    fi
    git config --global core.excludesfile ~/.gitignore
}

function gitignore() {
  v ~/.gitignore
}

function vimrc() {
  v ~/.config/nvim/init.lua
}

function tmuxc() {
  v ~/.tmux.conf
}

function ipyrc() {
  v ~/.ipython/profile_default/ipython_config.py
}

# work
function dotfiles() {
  cd ~/code/dkdc-io/dotfiles
}

function files() {
  cd ~/code/dkdc-io/files
}

function pfiles() {
  cd ~/code/dkdc-io/public_files
}

function product() {
  cd ~/code/ascend-io/product
}

function afiles() {
  cd ~/code/ascend-io/product/website
}

function cnotes() {
  v ~/code/ascend-io/product/website/docs/notes/customer-meetings.md
}

function drafts() {
  cd ~/code/ascend-io/product/website/docs/drafts
}

function pri() {
  v ~/code/dkdc-io/files/pri.md
}

function todo() {
  v ~/code/dkdc-io/files/todo.md
}

function notes() {
  v ~/code/dkdc-io/files/notes.md
}

# etc
function temp() {
  v temp.md
}

# python stuff
#alias python="python3"
#alias pip="pip3"
function ipython() {
  python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'
}

function ipy() {
  python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'
}

function eda() {
  python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()' -i eda.py
}

function dev() {
  python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()' -i dev.py
}

function di() {
  uv pip install --upgrade ipython ipykernel nbformat
}

function wp() {
  which python
}

function wp3() {
  which python3
}

function venv() {
  uv venv "$@"
}

function on() {
  . .venv/bin/activate
}

function off() {
  deactivate
}

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

function draw() {
  excalidraw
}

# eval "$(pyenv init -sh)"
export PYTHONBREAKPOINT="IPython.embed"
export GH_TOKEN=$(gh auth token)

autoload -Uz compinit
compinit

source <(kubectl completion zsh)
source <(gobi completion zsh)
