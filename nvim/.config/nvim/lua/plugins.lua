local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- add you plugins here like:

  --[[ Theming ]]--
    use 'tjdevries/colorbuddy.nvim'     -- colorbuddy allows us to run the gloombuddy theme
    use 'gruvbox-community/gruvbox'
    use 'kyazdani42/nvim-web-devicons'  -- A lua fork of vim-devicons
    use 'junegunn/goyo.vim'             -- Distraction-free writing in Vim, or a presentation mode
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }                                   -- A blazing fast and easy to configure neovim statusline written in pure lua
  -- some formatting in here too
    use {'prettier/vim-prettier', run = 'yarn install' }
    use 'b3nj5m1n/kommentary'           -- Neovim plugin to comment text in and out, written in lua

  
  --[[ (Code) Navigation ]]--
  -- treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'    -- View treesitter information directly in Neovim
    use 'sheerun/vim-polyglot'          -- A collection of language packs for Vim
  -- LSP
    use 'neovim/nvim-lspconfig'
    use 'anott03/nvim-lspinstall'

    use 'nvim-lua/completion-nvim'      -- an auto completion framework that aims to provide a better completion experience with neovim's built-in LSP
    use 'windwp/nvim-autopairs'         -- autopairs for neovim written in lua

  -- Fuzzy Finding
    use 'nvim-lua/popup.nvim'           -- WIP: An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim'         -- PreAlpha: All the lua functions I don't want to write twice
    use 'nvim-lua/telescope.nvim'
    use 'jremmen/vim-ripgrep'           -- is a version of grep, written in Rust

  -- CTAGS
    use'ludovicchabant/vim-gutentags'


  --[[ File Handling ]]--
    -- Nerdtree
      use 'preservim/nerdtree'


  --[[ git integration ]]--
    -- Fugitive
      use 'tpope/vim-fugitive'
    -- Nerdtree
      use 'Xuyuanp/nerdtree-git-plugin'
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }


  --[[ other Tools ]]--
    use 'markonm/traces.vim'            -- regex, show matches instantly
    use 'unblevable/quick-scope'        -- helps to get to any word on a line in two or three keystrokes with Vim's built-in find char

  end
)
