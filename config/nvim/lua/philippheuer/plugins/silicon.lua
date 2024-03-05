return {
  'michaelrommel/nvim-silicon',
  lazy = true,
	cmd = 'Silicon',
  init = function()
    local wk = require('which-key')
    wk.register({
      ['<leader>sc'] = { ':Silicon<cr>', 'Silicon: Capture' },
    }, {mode = { 'n', 'i' }})
    wk.register({
      ['<leader>sc'] = { ':\'<,\'>Silicon<cr>', 'Silicon: Capture' },
    }, {mode = 'v'})
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
      end
		})
	end
}
