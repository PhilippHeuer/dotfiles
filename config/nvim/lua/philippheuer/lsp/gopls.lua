return {
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true, -- auto-import missing packages when using autocomplete
      usePlaceholders = true, -- add placeholder params when completing a function
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
