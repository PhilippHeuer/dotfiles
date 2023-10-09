return {
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      -- see catalog: https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
      schemas = require("schemastore").json.schemas {
        ignore = {
          -- optionally exclude schemas here
        },
        extra = {
          {
            description = "My custom JSON schema",
            fileMatch = "foo.json",
            name = "foo.json",
            url = "https://example.com/schema/foo.json",
          },
        },
      },
      validate = { enable = true },
    },
  },
}
