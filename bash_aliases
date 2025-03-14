# On Arch Linux bash-completion needs to be installed and this file needs to be sourced.
source /usr/share/git/completion/git-prompt.sh
# Modified from this page:  https://wiki.archlinux.org/index.php/Color_Bash_Prompt#From_Arch_Forum_.231
PS1='\n \[\e[0;37m\]┌─[\[\e[0;36m\] \d \[\e[0;31m\]\T \[\e[0;37m\]] [\[\e[0;36m\] \h \[\e[0;37m\]] \[\e[0;31m\]$(__git_ps1 "[ %s ]")\n\[\e[0;37m\] └─[ \[\e[0;34m\]@ \[\e[0;32m\]\w \[\e[0;37m\]]\[\e[:;35m\]---> \[\e[0;37m\]'

####################
# non-unicode
# PS1="\n \[\e[1;37m\][\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\][ \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\]---> \[\e[0;37m\]"
####################

#export EDITOR=ed
export EDITOR=vim

export GOPATH=$HOME/programming/go

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/programming/bin"
export PATH="$PATH:$HOME/.local/bin"

export HISTCONTROL=ignoreboth:erasedups

# ===== aliases =====

alias wtf="pacman --color=always -Ss"
alias omg="sudo pacman -S"
alias upgrayedd="sudo pacman -Syu"
alias ls="ls --color=always --sort=extension --group-directories-first"
alias l="ls -l"
alias lh="ls -lh"
alias gps="ps aux --sort rss | grep"
alias ghist="history | grep"

# loop a song
alias music='mpv --loop=inf --no-video --ytdl-format="bestvideo[vcodec!=vp9]+bestaudio/best"'

alias gdb="gdb -q"

# tabs
alias vim="vim -p"

# Use arrow keys to backtrack in insert mode
alias ed='rlwrap ed'

alias links2="links2 https://duckduckgo.com"

# git stuff
alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gl="git log"
alias gp="git push"
alias gd="git diff"
alias gb="git branch"
alias gpo="git push origin master"

# example: clipboard file.txt
alias clipboard="xclip -sel clip <"

alias mkvirtualenv3='mkvirtualenv --python=/usr/bin/python3'
alias wo='workon $(basename `pwd`)3'
alias wo2='workon $(basename `pwd`)2'

# save image from clipboard
alias saveimage='xclip -selection c -o > '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ===== functions =====

whataremycolorsagain() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

# pretty json
pj() {
    python -m json.tool <"$1" | less
}

ale() {
    if [[ "$(pyenv local 2>&1)" == 'pyenv: no local version configured for this directory' ]]; then
        echo "No pyenv virtualenv set, exiting"
        return 1
    fi

    #if [[ -z "$VIRTUAL_ENV" ]]; then
    #echo "No virtualenv set, exiting"
    #return 1
    #fi

    # pylint  - syntax checking
    # isort   - auto sort imports according to pep8
    # vulture - find potentially dead code
    # flake8  - pep8 checker
    #pip install pylint isort vulture flake8 sphinxcontrib-napoleon
    pip install ruff isort
    pip install black mypy
}

va() {
    local regex_query="$1"
    local directory="$2"
    if [ -z "$directory" ]; then
        directory='.'
    fi
    vim "$(ag -l "$regex_query" "$directory")"
}

startover() {
    local NAME
    local PYTHON="$1"
    if [[ -z "$PYTHON" ]]; then
        PYTHON=3.13
    fi

    NAME="$(basename "$(pwd)")"
    pyenv virtualenv-delete -f "$NAME"

    pyenv virtualenv "$PYTHON" "$NAME"
    pyenv local "$NAME"
    echo '---'

    if [[ "$(pyenv local 2>&1)" == 'pyenv: no local version configured for this directory' ]]; then
        echo 'No virtualenv?'
        return
    fi

    if [ -e requirements.txt ]; then
        pip install -r requirements.txt
    fi
    if [ -e setup.py ]; then
        python setup.py develop
    fi
    if [ -e dev-requirements.txt ]; then
        pip install -r dev-requirements.txt
    fi
    if [ -e test-requirements.txt ]; then
        pip install -r test-requirements.txt
    fi

    python -m pip install pre-commit
    python -m pip install ruff mypy black
}

imp() {
    if [ -z "$2" ]; then
        python -c "import $1; print $1"
    else
        python -c "from $1 import $2; print $2"
    fi
}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
