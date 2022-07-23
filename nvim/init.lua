--
-- General Options 
-- 

vim.g.mapleader = ' '

vim.cmd([[ :set mouse=a ]])

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
  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- CHADtree
  use{
    'ms-jpq/chadtree', branch = 'chad', run = 'python4 -m chadtree deps'
  }
  -- Edit
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
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

-- Lines
vim.wo.cursorline = true
vim.cmd( [[ hi CursorLine ctermbg=black guibg=black ]] )
vim.cmd( [[ hi CursorLineNr ctermbg=black guibg=black ]] )

vim.wo.cursorcolumn = false
vim.cmd( [[ hi CursorColumn ctermbg=black guibg=black ]] )

vim.cmd( [[ set colorcolumn=120]])
-- vim.cmd( [[ hi ColorColumn ctermbg=black guibg=black ]])

--
-- Keybinds
--

-- General
--vim.cmd([[ inoremap fj <End> ]])
vim.cmd([[ nmap <silent> <leader>n :nohl<CR> ]])

-- Move lines up and down
vim.cmd([[ nnoremap <C-j> :m .+1<CR>== ]])
vim.cmd([[ nnoremap <C-k> :m .-2<CR>== ]])


vim.cmd([[ nnoremap <silent> <C-l> :bnext<CR> ]])
vim.cmd([[ nnoremap <silent> <C-h> :bprevious<CR> ]])
-- buffer/panes movements
vim.cmd([[ nnoremap <M-h> <C-W>h ]])
vim.cmd([[ nnoremap <M-j> <C-W>j ]])
vim.cmd([[ nnoremap <M-k> <C-W>k ]])
vim.cmd([[ nnoremap <M-l> <C-W>l ]])

-- Don't loose selection while indenting
vim.cmd([[ vnoremap < <gv ]])
vim.cmd([[ vnoremap > >gv ]])

--
-- Plugins configuration
--

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


-- CHADtree
local chadtree_settings = {
  ["view.window_options.cursorline"] = true,
  ["view.window_options.number"] = true,
  ["view.window_options.relativenumber"] = true,
  ["view.open_direction"] = "right"
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

vim.cmd([[ nnoremap <leader>e <cmd>CHADopen<cr> ]])
vim.cmd([[ nnoremap <leader>E <cmd>CHADopen --version-ctl<cr> ]])


-- Comment.vim
require('Comment').setup()


-- nvim-autopairs
require('nvim-autopairs').setup()

