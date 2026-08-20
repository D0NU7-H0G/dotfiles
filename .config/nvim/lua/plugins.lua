-- === PLUGINS === --

-- Treesitter --
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
  -- 'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
  -- 'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})
-- Render markdown --
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

-- Cord (Discord RPC)
vim.pack.add { 'https://github.com/vyfor/cord.nvim' }

require('cord').setup ({
  text = {
    workspace = function(opts)
      if opts.workspace == 'elsie' then
	return 'In $HOME'
      end
      return 'In ' .. opts.workspace
    end,
  }
})

-- Nvim tree --
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


-- fff (file search) --
vim.pack.add({ 'https://github.com/dmtrKovalenko/fff' })

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff') end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set('n', 'ff', function() require('fff').find_files() end, { desc = 'FFFind files' })
