-- settings.lua
-- see https://github.com/nanotee/nvim-lua-guide#using-meta-accessors

local o = vim.o		-- global options, vim.api.nvim_set_option()            - behaves like `:set`
local go = vim.go	-- global options                                       - behaves like `:setglobal`
local wo = vim.wo	-- window-local options, vim.api.nvim_win_set_option()  - behaves like `:setlocal` for window-local options
local bo = vim.bo	-- buffer-local options, vim.api.nvim_buf_set_option()  - behaves like `:setlocal` for buffer-local options

--[[ GLOBAL OPTIONS ]]--
  o.swapfile = false          -- eauivalent to `:noswapfile`? Make this option sense?
  o.updatetime = 50           -- write swap file to disc if in x milliseconds nothing is typed (recommendation of the Primeagen)
  o.dir = '/tmp'
  o.smartcase = true
  o.laststatus = 2
  o.hlsearch = true           -- highlight search results
  o.incsearch = true
  o.ignorecase = true         -- case insensitive matching
  o.termguicolors = true
  -- o.syntax = 'on'             -- enable syntax highlighting (should be set in nvim by default)
  o.errorbells = false        -- don't ring the bell on errors
  o.showmode = false          -- don't show message on last line during insert, replace or visual mode
  o.showmatch = true          -- shows matching bracket
  o.backup = false            -- don't create a backup file before overwriting a file
  o.undodir = vim.fn.stdpath('config') .. '/undodir'
  o.undofile = true
  o.hidden = true
  o.completeopt = 'menuone,noinsert,noselect'
  o.tabstop = 2               -- number of columns occupied by a tab character
  o.softtabstop = 2           -- see multiple spaces as tabstops so <BS> does the right thing
  o.shiftwidth = 2            -- width for autoindents
  o.expandtab = true
  o.scrolloff = 8             -- minimal number of screen lines to keep above and below the cursor
  o.wildmode = 'list:longest' -- When more than one match, list all matches and complete till longest common string.
  o.mouse = 'v'               -- enable Mouse support for Visual mode

--[ WINDOW-LOCAL OPTIONS ]--

  -- https://bryankegley.me/posts/nvim-getting-started/
  wo.number = true        -- add line numbers
  wo.relativenumber = true
  wo.signcolumn = 'yes'   -- draw the signcolumn (e.g. for git signs)
  wo.wrap = false
  wo.colorcolumn = '100'  -- set a column border at column 100

--[[ BUFFER-LOCAL OPTIONS ]]--
  bo.expandtab = true     -- converts tabs to white space

  -- https://bryankegley.me/posts/nvim-getting-started/
  bo.autoindent = true    -- indent a new line the same amount as the line just typed
  bo.smartindent = true
  --bo.swapfile = false
  bo.fileencoding = ""    -- when empty, the file will be saved with UTF-8
  bo.omnifunc = "syntaxcomplete#Complete"

--[ OTHER OPTIONS ]--
  -- vim.opt.{option}: behaves like :set
  -- vim.opt_global.{option}: behaves like :setglobal
  -- vim.opt_local.{option}: behaves like :setlocal

  vim.opt.shortmess:append({ c = true })    -- don't give `ins-completion-menu` messages (recommendation of the Primeagen)


--[ API OPTIONS ]--

  -- vim.api.nvim_command('filetype plugin on')          -- enable loading the plugin files for specific file types; this should be set nvim by default
  vim.api.nvim_command('filetype plugin indent on')   -- allows auto-indenting depending on file type

  -- Global variables `g:` (see [Using api functions](https://github.com/nanotee/nvim-lua-guide#using-api-functions-1))

    -- vimwiki: change storage path and set to markdown syntax
    vim.api.nvim_set_var('vimwiki_list', {{ path = '~/Dokumente/vimwiki', syntax = 'markdown', ext = '.md'}})
