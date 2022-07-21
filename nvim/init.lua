--
-- General Options 
-- 

vim.g.mapleader = ' '

-- Kill cursor switch for shitty Windows Terminal
-- vim.opt.guicursor = ''

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hidden = true
vim.opt.errorbells = false

vim.opt.termguicolors = true

vim.opt.signcolumn = 'yes'
-- Give more space for displaying messages.
vim.opt.cmdheight = 1

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.opt.scrolloff = 8

-- WSLg clipboard settings
vim.cmd([[ 
set clipboard=unnamedplus

let g:clipboard = {
    \   'name': 'win32yank-wsl',
    \   'copy': {
    \      '+': 'win32yank.exe -i --crlf',
    \      '*': 'win32yank.exe -i --crlf',
    \    },
    \   'paste': {
    \      '+': 'win32yank.exe -o --lf',
    \      '*': 'win32yank.exe -o --lf',
    \   },
    \   'cache_enabled': 0,
    \ } 
    ]])


--
-- Plugins
--

require('packer').startup(function()
  -- Packer itself
  use 'wbthomason/packer.nvim'

  --Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Themes
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'

end)

--
-- Visual --
--

-- Themes
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'

vim.g.tokyonight_style = 'night'

vim.cmd([[ colorscheme gruvbox ]])


-- Telescope
require('telescope').setup{
  defaults = {
    initial_mode = 'insert'
  }
}
vim.cmd([[ nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr> ]])
vim.cmd([[ nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr> ]])
vim.cmd([[ nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr> ]]) 
vim.cmd([[ nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr> ]])
