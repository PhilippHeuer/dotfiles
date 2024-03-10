-- openapi file type
vim.filetype.add {
  pattern = {
    ['openapi.*%.ya?ml'] = 'yaml.openapi',
    ['openapi.*%.json'] = 'json.openapi',
  },
}

if not vim.tbl_isempty(vim.treesitter) then -- register treesitter parsers for openapi file types
  vim.treesitter.language.register('yaml', 'yaml.openapi')
  vim.treesitter.language.register('json', 'json.openapi')
end
