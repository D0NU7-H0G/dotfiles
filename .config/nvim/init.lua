vim.api.nvim_create_autocmd("VimEnter", { -- opens nvimtree on start
	callback = function()
		vim.cmd("NvimTreeOpen")
	end,
})

vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})

require("rose-pine").setup({
	variant = "auto",
	dark_variant = "moon",
	dim_inactive_windows = false,
	extend_background_behind_borders = true,
})
vim.cmd("colorscheme rose-pine")

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
    -- 'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
    -- 'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})
require('render-markdown').setup({
    latex = {
        enabled = true,
        render_modes = false,
        converter = { 'utftex', 'latex2text' },
        inline = true,
        block = true,
        highlight = 'RenderMarkdownMath',
        position = 'center',
        top_pad = 0,
        bottom_pad = 0,
    },
})

vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- optional
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

  -- disable netrw at the very start of your init.lua
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
  vim.opt.termguicolors = true

  -- empty setup using defaults
  require("nvim-tree").setup()

  -- OR setup with a config

  ---@type nvim_tree.config
  local config = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  }
  require("nvim-tree").setup(config)

