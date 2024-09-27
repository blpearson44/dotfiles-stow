local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font "FiraCode Nerd Font"
config.font_size = 16.0
config.default_prog = {'pwsh.exe'}
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.webgpu_preferred_adapter = {
    backend="DirectX 12",
    name="llvmpipe (LLVM 14.0.0, 256 bits)",
    device_type="Cpu",
}
config.window_decorations = "RESIZE"

config.window_padding = {
    left = 2,
    right = 2,
    top = 10,
    bottom = 2
}

config.leader = { key = ' ', mods= 'CTRL', timeout_milliseconds = 1000}

config.keys = {
    -- Splits
    { key = '\\',   mods = 'LEADER',        action = act.SplitHorizontal {domain = 'CurrentPaneDomain'} },
    { key = '-',    mods = 'LEADER',        action = act.SplitVertical {domain = 'CurrentPaneDomain'} },
    { key = 'x',    mods = 'LEADER',        action = act.CloseCurrentPane {confirm = false} },
    -- Tabs
    { key = '\t',   mods = 'CTRL',          action = act.ActivateTabRelative(1) },
    { key = '\t',   mods = 'CTRL|SHIFT',    action = act.ActivateTabRelative(-1) },
    { key = 'x',    mods = 'CTRL|LEADER',   action = act.CloseCurrentTab { confirm = true} },
    { key = 'c',    mods = 'LEADER',        action = act.ShowLauncher },
    { key = 'Escape', mods = 'LEADER', action = act.ActivateCopyMode}
}

-- plugins
-- vim-wezterm navigation
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
smart_splits.apply_to_config(config, {
    direction_keys = {'h', 'j', 'k', 'l'},
    modifiers = {
        move = 'CTRL'
    }
})
-- tab bar
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config,
    {
        position = "top",
        modules = {
            workspace = {
                enabled = false
            },
            leader ={
                enabled = false
            },
            hostname = {
                enabled = false
            },
            clock = {
                enabled = false
            },
            cwd = {
                enabled = false
            },
            pane = {
                enabled = true
            },
            username = {
                enabled = false
            }
        }
    }
)
return config
