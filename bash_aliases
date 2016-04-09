
# Modified idea from this page:  https://wiki.archlinux.org/index.php/Color_Bash_Prompt#From_Arch_Forum_.231
PS1="\n \[\e[1;37m\]┌─[\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\] └─[ \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\]---> \[\e[0;37m\]"

####
# non-unicode
# PS1="\n \[\e[1;37m\][\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\][ \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\]---> \[\e[0;37m\]"
####

EDITOR=vim

# === functions ===

function whataremycolorsagain {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

export GOROOT=/usr/go
export GOPATH=$HOME/programming/go/
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$GOROOT/bin:$GOPATH/bin:/usr/mybin/jdk1.8.0/bin:$HOME/programming/real/shellstuff:/usr/racket/bin"

#alias

alias wtf="aptitude search"
alias omg="sudo apt-get install"
alias l="ls -l --sort=extension --group-directories-first"
alias lh="ls -lh --sort=extension --group-directories-first"
alias gps="ps aux | grep"
alias ghist="history | grep"

# loop a song
alias z="mplayer -loop 0"
# shuffle music
alias puburl="dropbox puburl"

alias gdb="gdb -q"

alias sxiv="sxiv-helper"

alias links2="links2 https://duckduckgo.com"

alias vim="vim -p"
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
