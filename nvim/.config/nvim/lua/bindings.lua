-- maps.lua

-- source https://icyphox.sh/blog/nvim-lua/
  local map = vim.api.nvim_set_keymap

  -- map the leader key
  map('n', '<Space>', '', {})
  vim.g.mapleader = ' '  -- 'vim.g' sets global variables

  options = { noremap = true }
  map('n', '<leader><esc>', ':nohlsearch<cr>', options)
  map('n', '<leader>n', ':bnext<cr>', options)
  map('n', '<leader>p', ':bprev<cr>', options)


-- LSP (source https://bryankegley.me/posts/nvim-getting-started/)
  map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', options)
  map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', options)
  map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', options)
  map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', options)
  map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>', options)
  map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', options)
  map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', options)
  map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', options)
  map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>', options)
  map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>', options)
  map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', options)

-- Fuzzy Finder (source https://bryankegley.me/posts/nvim-getting-started/)
  map('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>', options)
  map('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>', options)
  map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>', options)
  map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>', options)

-- Fugitive
  -- config of [ThePrimeagen](https://youtu.be/PO6DxfGPQvw?t=98)
  -- vim-fugitive
  -- https://github.com/tpope/vim-fugitive
  --
  --  commands:
  --    :G                      git status
  --                              s - toggle to staged
  --                              u - toggle to unstaged
  --                              dv  on the file to resolve for resolving merge conflicts
  --                                  jump to the '<<<<<<HEAD' line
  --                                  :diffget //2    take the selection of the left side
  --                                  :diffget //3    take the selection of the right side
  --                                  or change manually in the middle
  --                                  end merging of this file by closing the window: <ctrl>+w <ctrl>+o
  --                                  (after that coc restart is neccessary `:CocRestart`)
  --    :Gcommit                starts commit editor screen, with :wq the commit is done
  --    :Gpush                  push to origin
  --    :Git merge <ToBranch>   ddd
  map('n', '<leader>gj', ':diffget //3<CR>', options)
  map('n', '<leader>gf', ':diffget //2<CR>', options)
  map('n', '<leader>gs', ':G<CR>', options)
  


  -- map('n', '<C-b>', ':lua require"configs".myNERDTreeToggle()<CR>', options)
  --" nnoremap <silent> <C-b> :NERDTreeToggle<CR>
