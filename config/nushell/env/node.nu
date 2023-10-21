# add to path
$env.PATH = ($env.PATH | split row (char esep) | append '$HOME/.local/share/node/bin')
