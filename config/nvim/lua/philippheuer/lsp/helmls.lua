return {
  filetypes = {
    'helm'
  },
  settings = {
    ['helm-ls'] = {
      logLevel = 'info',
      valuesFiles = {
        mainValuesFile = 'values.yaml',
        lintOverlayValuesFile = 'values.lint.yaml',
        additionalValuesFilesGlobPattern = 'values*.yaml'
      },
      yamlls = {
        enabled = true,
        diagnosticsLimit = 50,
        showDiagnosticsDirectly = false,
        path = 'yaml-language-server',
        config = { -- https://github.com/redhat-developer/yaml-language-server#language-server-settings
          schemas = {
            kubernetes = 'templates/**',
          },
          completion = true,
          hover = true,
        }
      }
    }
  },
}
