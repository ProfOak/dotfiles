function fish_prompt --description 'Informative prompt'
    if functions -q fish_is_root_user; and fish_is_root_user
        printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                         and set_color $fish_color_cwd_root
                                                         or set_color $fish_color_cwd) \
            (prompt_pwd) (set_color normal)
    else
        set -l status_color (set_color $fish_color_status)
        set -l statusb_color (set_color --bold $fish_color_status)
        set -l normal_color (set_color normal)
        # TODO: Invoking date twice is undesired. In bash these are escape sequences.
        # https://tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
        set -l date_string "$(set_color cyan)""$(date "+%a %b %d") $(set_color red)""$(date +%I:%M:%S)""$normal_color"
        set -l hostname_string "$(set_color cyan)$(prompt_hostname)$normal_color"
        set -l cwd $(string replace "$HOME" '~' "$PWD")
        set -l cwd_string "$(set_color green)$cwd$normal_color"
        printf '\n ┌─[ %s ] [ %s ]\n └─[ %s@ %s ] %s> ' \
            $date_string \
            $hostname_string \
            (set_color blue) \
            $cwd_string \
            (set_color red)
    end
end
