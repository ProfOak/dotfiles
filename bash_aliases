
# Modified idea from this page:  https://wiki.archlinux.org/index.php/Color_Bash_Prompt#From_Arch_Forum_.231
PS1="\n \[\e[1;37m\]┌─[\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\] └─[ \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\]---> \[\e[0;37m\]"

#### 
# non-unicode
# PS1="\n \[\e[1;37m\][\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\][ \[\e[1;34m\]@ \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\]---> \[\e[0;37m\]"
####

#functions

function ghist {
    history | grep $1
}
function gps {
    ps aux | grep $1
}

# short description from wikipedia
function wiki {
        dig +short txt $1.wp.dg.cx
}

# display the file size for current folder
function fs {
    printf "%s: " `pwd | tr "/" " " | awk '{print $NF}'`
    ls -l | awk {'print $5'} | awk '{sum+=$1} END {printf "~%dKB, ~%dMB, ~%dGB \n", sum/1000, sum/1000000, sum/1000000000}'
}

#alias

alias wtf="aptitude search"
alias omg="sudo apt-get install"
# loop a song
alias z="mplayer -loop 0"
# shuffle music
alias sm="mplayer -loop 0 -shuffle ~/Music/*3"
alias puburl="dropbox puburl"
alias gdb="gdb -q"

