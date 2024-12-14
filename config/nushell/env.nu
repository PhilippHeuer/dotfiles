# Nushell Environment Config File

$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| "> " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| ": " }
$env.PROMPT_MULTILINE_INDICATOR = {|| ">>> " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# node
source ~/.config/nushell/env/node.nu

# carapace completions
let carapace_plugin_path = $nu.default-config-dir | path join 'plugins/carapace.nu'
if (which carapace | is-not-empty) {
    mkdir ~/.cache/carapace
    carapace _carapace nushell | save -f ~/.config/nushell/plugins/carapace.nu
} else {
    "# carapace is not installed" | save -f ~/.config/nushell/plugins/carapace.nu
}

# zoxide
let zoxide_plugin_path = $nu.default-config-dir | path join 'plugins/zoxide.nu'
if (which zoxide | is-not-empty) {
    mkdir ~/.cache/zoxide
    zoxide init nushell | save -f ~/.config/nushell/plugins/zoxide.nu
} else {
    "# zoxide is not installed" | save -f ~/.config/nushell/plugins/zoxide.nu
}

# starship
let starship_plugin_path = $nu.default-config-dir | path join 'plugins/starship.nu'
if (which starship | is-not-empty) {
    mkdir ~/.cache/starship
    starship init nu | save -f ~/.config/nushell/plugins/starship.nu

    def create_left_prompt [] {
        starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
    }

    $env.PROMPT_COMMAND = { || create_left_prompt }
    $env.PROMPT_COMMAND_RIGHT = ""
    $env.STARSHIP_SHELL = "nu"
} else {
    "# starship is not installed" | save -f ~/.config/nushell/plugins/starship.nu
}

# atuin
let atuin_plugin_path = $nu.default-config-dir | path join 'plugins/atuin.nu'
if (which atuin | is-not-empty) {
    mkdir ~/.cache/atuin
    atuin init nu | save -f ~/.config/nushell/plugins/atuin.nu
} else {
    "# atuin is not installed" | save -f ~/.config/nushell/plugins/atuin.nu
}

# editor
if (which nvim | is-not-empty) {
    $env.EDITOR = "nvim"
} else if (which vim | is-not-empty) {
    $env.EDITOR = "vim"
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
  ($nu.config-path | path dirname | path join modules)
  ($nu.config-path | path dirname | path join completions)
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
  ($nu.config-path | path dirname | path join plugins)
]
