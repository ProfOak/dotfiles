local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font 'Jetbrains Mono'
config.font_size = 18.0
config.colors = {
    cursor_fg = 'black',
    cursor_bg = 'white',
    selection_fg = 'black',
    selection_bg = 'white',

    foreground = '#ffffff',
    background = '#000000',
    ansi = {
        '#000000',
        '#cc6666',
        '#66cc99',
        '#cc9966',
        '#6699cc',
        '#cc6699',
        '#66cccc',
        '#cccccc',
    },
    brights = {
        '#999999',
        '#ff9999',
        '#99ffcc',
        '#ffcc99',
        '#99ccff',
        '#ff99cc',
        '#99ffff',
        '#ffffff',
    }
}

local act = wezterm.action
config.keys = {
    { key = 'DownArrow', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain'},
    { key = 'LeftArrow', mods = 'CTRL', action = act.ActivateTabRelative(-1)},
    { key = 'RightArrow', mods = 'CTRL', action = act.ActivateTabRelative(1)},
}
return config
