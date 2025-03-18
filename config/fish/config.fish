if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    #export EDITOR=ed
    export EDITOR=vim
    export GOPATH=$HOME/programming/go
    export PATH="$PATH:$HOME/programming/bin"
    export PATH="$PATH:$HOME/.local/bin"
    export PATH="$PATH:$GOPATH/bin"
    export HISTCONTROL=ignoreboth:erasedups

    # NOTE: It's not clear whether or not the key sequence is still needed in fish 4.0
    # bind \e\[A history-prefix-search-backward
    # bind \e\[B history-prefix-search-forward
    bind up history-prefix-search-backward
    bind down history-prefix-search-forward

    alias ls="ls --color=always --sort=extension --group-directories-first"
    alias l="ls -l"
    alias lh="ls -lh"
    alias gps="ps aux --sort rss | grep"
    alias ghist="history | grep"

    # loop a song
    alias music='mpv --loop=inf --no-video --no-resume-playback --ytdl-format="bestvideo[vcodec!=vp9]+bestaudio/best"'

    alias gdb="gdb -q"

    # tabs
    alias vim="vim -p"

    # Use arrow keys to backtrack in insert mode
    alias ed='rlwrap ed'

    alias links2="links2 https://duckduckgo.com"

    alias ga="git add"
    alias gs="git status"
    alias gc="git commit"
    alias gl="git log"
    alias gp="git push"
    alias gd="git diff"
    alias gb="git branch"

    # example: clipboard file.txt
    alias clipboard="xclip -sel clip <"

    # save image from clipboard
    #alias saveimage='xclip -selection c -o > '

    function saveimage
        set -l filename $argv[1]
        if test -e $filename;
            echo "Error: $filename exists"
        else
            xclip -selection c -o > $filename
        end
    end

    function _os_version_name
      if not string length --quiet $OS_VERSION_NAME
            set -g OS_VERSION_NAME $(lsb_release -d|grep -oE '(Arch|Debian)')
        end
        echo $OS_VERSION_NAME
    end

    function wtf
        switch $(_os_version_name)
        case 'Arch'
            pacman --color=always -Ss $argv
        case 'Debian'
            apt search $argv
        end
    end

    function omg
        switch $(_os_version_name)
        case 'Arch'
            sudo pacman -S $argv
        case 'Debian'
            sudo apt install $argv
        end
    end

    function upgrayedd
        switch $(_os_version_name)
        case 'Arch'
            sudo pacman -Syu
        case 'Debian'
            sudo apt update && sudo apt upgrade
        end
    end

    function whataremycolorsagain
        for i in (seq 0 255)
            set_color -o $i
            echo -e "colour$i"
            set_color normal
        end
    end

    # pretty json
    function pj
        python -m json.tool < $argv[1] | less
    end

    function ale
        if not pyenv local > /dev/null 2>&1
            echo "No pyenv virtualenv set, exiting"
            return 1
        end
        pip install ruff mypy
    end

    function va
        set -l regex_query $argv[1]
        set -l directory $argv[2]

        if test -z $directory;
            set -l directory .
        end

        vim (ag -l $regex_query $directory)
    end

    function startover
        set -l NAME (basename (pwd))
        set -l PYTHON "$argv[1]"

        if test -z $PYTHON;
            set PYTHON '3.13'
        end

        echo "Using python $PYTHON"
        pyenv virtualenv-delete -f "$NAME"
        pyenv virtualenv "$PYTHON" "$NAME"
        pyenv local "$NAME"

        echo '---'

        if test $(pyenv local 2>&1) = "pyenv: no local version configured for this directory";
            echo 'No virtualenv?'
            return
        end

        if [ -e requirements.txt ];
            pip install -r requirements.txt
        end

        if [ -e dev-requirements.txt ];
            pip install -r dev-requirements.txt
        end

        if [ -e test-requirements.txt ];
            pip install -r test-requirements.txt
        end

        pip install -e .

        python -m pip install pre-commit
        python -m pip install ruff mypy black
    end

    function imp
        if test -z "$argv[2]"
            python -c "import $argv[1]; print($argv[1])"
        else
            python -c "from $argv[1] import $argv[2]; print($argv[2])"
        end
    end

    set -x PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source

    function last_history_item
        echo $history[1]
    end
    abbr -a !! --position anywhere --function last_history_item
end
