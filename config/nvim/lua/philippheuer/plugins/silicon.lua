return {
  'michaelrommel/nvim-silicon',
  lazy = true,
	cmd = 'Silicon',
  init = function()
    vim.keymap.set('n', '<leader>sc', ':Silicon<cr>', { desc = '[S]creen[S]hot (Silicon)' })
    vim.keymap.set('v', '<leader>sc', ':\'<,\'>Silicon<cr>', { desc = '[S]creen[S]hot (Silicon)' })
  end,
  config = function()
		require('silicon').setup({
			font = 'JetBrainsMono Nerd Font=34;Noto Color Emoji=34',
      theme = 'tokyonight_night',
      background = '#fff0', -- transparent
      shadow_color = '#555',
      shadow_blur_radius = 0,
      -- no_window_controls = true,
      window_title = function()
        return vim.fn.expand('%:t')
      end,
      output = function()
        return os.getenv('HOME') .. '/screenshots/' .. os.date('!%Y-%m-%dT%H-%M-%S') .. '.png'
      end,
		})
	end
}
