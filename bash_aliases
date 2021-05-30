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

export PATH="$PATH:$GOPATH/bin"             # go stuff
export PATH="$PATH:$HOME/programming/bin"   # personal stuff
export PATH="$PATH:$HOME/.local/bin"

export HISTCONTROL=ignoreboth:erasedups

# ===== aliases =====

alias wtf="pacman --color=always -Ss"
alias omg="sudo pacman -S"
alias ls="ls --color=always --sort=extension --group-directories-first"
alias l="ls -l"
alias lh="ls -lh"
alias gps="ps aux --sort rss | grep"
alias ghist="history | grep"

# loop a song
alias z="mplayer -loop 0"
alias music='mpv --loop=inf --no-video --ytdl-format="bestvideo[vcodec!=vp9]+bestaudio/best"'

alias gdb="gdb -q"
alias vim="vim -p"

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

# Use arrow keys to backtrack in insert mode
alias ed='rlwrap ed'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ===== functions =====

whataremycolorsagain() {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

# pretty json
pj() {
    cat $1 | python -m json.tool | less
}

ale() {
    if [[ -z "$VIRTUAL_ENV" ]]; then
        echo "No virtualenv set, exiting"
        return 1
    fi

    # pylint  - syntax checking
    # isort   - auto sort imports according to pep8
    # vulture - find potentially dead code
    # flake8  - pep8 checker
    #pip install pylint isort vulture flake8 sphinxcontrib-napoleon
    pip install pylint isort
    pip install black mypy
}

va() {
    local regex_query="$1"
    local directory="$2"
    if [ -z "$directory" ]; then
        directory='.'
    fi
    vim $(ag -l "$regex_query" "$directory")
}

startover2() {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        deactivate
    fi

    local venv="$(basename `pwd`)2"
    rmvirtualenv "$venv"
    mkvirtualenv "$venv"

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
}

startover() {
    # needs a full path to the python binary in /usr/bin/
    local PYTHON="$1"

    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        deactivate
    fi

    if [[ -z "$PYTHON" ]]; then
        PYTHON=/usr/bin/python3.9
    fi

    local venv="$(basename `pwd`)3"
    rmvirtualenv "$venv"
    mkvirtualenv --python="$PYTHON" "$venv"

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
}

cry() {
    ssh-add -l > /dev/null 2>&1
    if [[ $? -eq 1 ]]; then
        eval "$(ssh-agent)" > /dev/null 2>&1
        ssh-add -k > /dev/null 2>&1
    fi
}

imp() {
    if [ -z "$2" ]; then
        python -c "import $1; print $1"
    else
        python -c "from $1 import $2; print $2"
    fi
}

vpn() {
    local action="$1"
    sudo systemctl "$action" openvpn-client@me
}
