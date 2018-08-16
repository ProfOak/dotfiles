# Modified from this page:  https://wiki.archlinux.org/index.php/Color_Bash_Prompt#From_Arch_Forum_.231
PS1="\n \[\e[1;37m\]┌─[\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\] └─[ \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\]---> \[\e[0;37m\]"

####
# non-unicode
# PS1="\n \[\e[1;37m\][\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\][ \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\]---> \[\e[0;37m\]"
####

#EDITOR=ed
EDITOR=vim

export GOROOT=/usr/go
export GOPATH=$HOME/programming/go/

export PATH="$PATH:$GOROOT/bin:$GOPATH/bin" # go stuff
export PATH="$PATH:$HOME/programming/bin"   # personal stuff

# ===== aliases =====

alias wtf="aptitude search"
alias omg="sudo apt-get install"
alias l="ls -l --sort=extension --group-directories-first"
alias lh="ls -lh --sort=extension --group-directories-first"
alias gps="ps aux | grep"
alias ghist="history | grep"

# loop a song
alias z="mplayer -loop 0"

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
alias gpo="git push origin master"

alias clipboard="xclip -sel clip <"

alias gogo="cd $GOPATH"
alias mygo="cd $GOPATH/src/github.com/ProfOak"
alias mkvirtualenv3='mkvirtualenv --python=/usr/bin/python3'

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

va() {
    local regex_query="$1"
    local directory="$2"
    if [ -z "$directory" ]; then
        directory='.'
    fi
    vim $(ag -l "$regex_query" "$directory")
}

startover() {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        deactivate
    fi

    venv=$(basename `pwd`)
    rmvirtualenv "$venv"
    mkvirtualenv "$venv"
    echo $?

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

imp()
    if [ -z "$2" ]; then
        python -c "import $1; print $1"
    else
        python -c "from $1 import $2; print $2"
    fi
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
    pip install pylint isort vulture flake8
}
