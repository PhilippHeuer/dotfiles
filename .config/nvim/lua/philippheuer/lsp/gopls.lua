return {
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,    
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
