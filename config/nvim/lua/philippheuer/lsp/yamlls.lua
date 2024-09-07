return {
  executable = 'yaml-language-server',
  filetypes = { 'yaml', 'yml' },
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = '',
      },
      -- see catalog: https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
      schemas = require('schemastore').yaml.schemas {
        ignore = {
          -- optionally exclude schemas here
        },
        extra = {
          {
            description = 'My custom JSON schema',
            fileMatch = 'foo.json',
            name = 'foo.json',
            url = 'https://example.com/schema/foo.json',
          },
        },
      },
    }
  },
}
