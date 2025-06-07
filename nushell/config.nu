# config.nu
#
# Installed by:
# version = "0.104.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.buffer_editor = "nvim"

$env.XDG_CONFIG_HOME = $env.HOME | path join .config
$env.XDG_DATA_HOME = $env.HOME | path join .local/share
$env.XDG_CACHE_HOME = $env.HOME | path join .cache
$env.XDG_STATE_HOME = $env.HOME | path join .local/state
$env.STARSHIP_CONFIG = $env.XDG_CONFIG_HOME | path join starship/starship.toml

$env.config.hooks = {
    pre_prompt: [{ print ""  }]
}

source ($nu.default-config-dir | path join "catppuccin_mocha.nu")
source ~/.cache/carapace/init.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
