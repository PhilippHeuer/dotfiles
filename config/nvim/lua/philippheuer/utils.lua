local M = {}

-- Function to check if a directory is a Git directory
M.is_git_directory = function()
	local result = vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 and result:find("true") then
		return true
	else
		return false
	end
end

-- Function to find the project directory
M.find_project_dir = function()
  local current_dir = vim.fn.getcwd()
  local git_dir = M.find_git_directory(current_dir)

  if git_dir then
      return git_dir
  else
      -- Fallback: if no .git directory found, return the current directory
      return current_dir
  end
end

-- Function to find the nearest Git directory by traversing upwards
M.find_git_directory = function(start_dir)
  local dir = start_dir or vim.fn.getcwd()

  while dir ~= '/' do
      if M.is_git_directory(dir) then
          return dir
      end

      -- Move one directory up
      dir = vim.fn.fnamemodify(dir, ':h')
  end

  return nil  -- No Git directory found
end

return M
