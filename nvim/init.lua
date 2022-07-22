--
-- General Options 
-- 

vim.g.mapleader = ' '

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

-- Kill cursor switch for shitty Windows Terminal
-- vim.opt.guicursor = ''


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
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
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


vim.wo.cursorline = true
vim.cmd( [[ hi CursorLine ctermbg=black guibg=black ]] )
vim.cmd( [[ hi CursorLineNr ctermbg=black guibg=black ]] )

vim.wo.cursorcolumn = false
vim.cmd( [[ hi CursorColumn ctermbg=black guibg=black ]] )

vim.cmd( [[ set colorcolumn=120]])
-- vim.cmd( [[ hi ColorColumn ctermbg=black guibg=black ]])


-- Telescope
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    initial_mode = 'insert',
    border = true,
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
vim.cmd([[ nnoremap <leader>fj i<cmd>Telescope find_files<CR>]])
vim.cmd([[ nnoremap <leader>fk i<cmd>lua require('telescope.builtin').live_grep()<cr>]])
vim.cmd([[ nnoremap <leader>fp i<cmd>lua require('telescope.builtin').buffers()<cr>]]) 
vim.cmd([[ nnoremap <leader>fh i<cmd>lua require('telescope.builtin').help_tags()<cr>]])
vim.cmd([[ nnoremap <leader>fm <cmd>lua require('telescope.builtin').grep_string()<cr>]])
