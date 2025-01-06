return {
  executable = 'ansible-language-server',
  filetypes = { 'yaml.ansible' },
  settings = {
    ansible = {
      ansible = {
        path = 'ansible'
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = 'python'
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = 'ansible-lint'
        }
      }
    }
  }
}