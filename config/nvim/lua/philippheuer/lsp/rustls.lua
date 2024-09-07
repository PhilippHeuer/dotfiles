return {
  executable = 'rust-analyzer',
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      }
    }
  },
}
