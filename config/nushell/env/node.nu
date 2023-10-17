# add to path
export-env {
    $env.PATH = ($env.PATH | split row (char esep) | append '$HOME/.local/share/node/bin')
}
