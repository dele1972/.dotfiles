-- treesitter (source https://bryankegley.me/posts/nvim-getting-started/)
  local configs = require'nvim-treesitter.configs'
  configs.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        --[[ goto_node = '<cr>',
        show_help = '?', ]]
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = true
    }

  }

-- LSP (source https://bryankegley.me/posts/nvim-getting-started/)
  -- local lspconfig = require'lspconfig'
  -- local completion = require'completion'
  -- local function custom_on_attach(client)
  --   print('Attaching to ' .. client.name)
  --   completion.on_attach(client)
  -- end
  -- local default_config = {
  --   on_attach = custom_on_attach,
  -- }
  -- -- setup language servers here
  -- lspconfig.tsserver.setup(default_config) 

  -- -- to avoid errors dominating the editor the handler (textDocument/publishDiagnostics) will be customized
  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  --   vim.lsp.diagnostic.on_publish_diagnostics, {
  --     underline = true,
  --     virtual_text = false,
  --     signs = true,
  --     update_in_insert = true,
  --   }
  -- )

-- LSP
  -- source [Keybindings and completion](https://github.com/neovim/nvim-lspconfig#keybindings-and-completion)
  -- but completion is added https://github.com/nvim-lua/completion-nvim#setup
  local nvim_lsp = require('lspconfig')
  local completion = require'completion'

  -- Use an on_attach function to only map the following keys after the language server attaches to 
  -- the current buffer
  -- Note: you must pass the defined on_attach as an argument to every setup {} call and the
  -- keybindings in on_attach only take effect after the language server has started 
  -- (attached to the current buffer).
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    --enable nvim-lua/completion-nvim
    print('Attaching to ' .. client.name)
    completion.on_attach(client)

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  end

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { "tsserver", "pyright", "rust_analyzer" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

-- NERDTree
  vim.g.NERDTreeShowHidden = 1
  vim.g.NERDTreeMinimalUI = 1
  vim.g.NERDTreeIgnore = {[[\.git$]],[[^node_modules$]]}
  vim.g.NERDTreeStatusline = ''
  vim.g.NERDTreeQuitOnOpen = 1    -- close NERDTree window after opening a file
  vim.NERDTreeShowLineNumbers=1   -- enable line numbers
  -- nerdtree-git-plugin
    vim.g.NERDTreeGitStatusUseNerdFonts = 1   -- you should install nerdfonts by yourself. default: 0
  -- https://github.com/nanotee/nvim-lua-guide#vimapinvim_command
  -- https://github.com/nanotee/nvim-lua-guide#vimapinvim_exec

-- kommentary
  local kommentary = require('kommentary.config')
  kommentary.configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = false
  })

-- gitsigns
  require('gitsigns').setup()

-- https://github.com/windwp/nvim-autopairs#default-values
  --require('nvim-autopairs').setup()
  local npairs = require('nvim-autopairs')
  -- npairs and treesitter (to check pair)
    npairs.setup({
        check_ts = true,
        ts_config = {
            lua = {'string'},-- it will not add pair on that treesitter node
            javascript = {'template_string'},
            java = false,-- don't check treesitter on java
        }
    })

    require('nvim-treesitter.configs').setup {
        autopairs = {enable = true}
    }

    local ts_conds = require('nvim-autopairs.ts-conds')


    -- press % => %% is only inside comment or string
    local Rule = require('nvim-autopairs.rule')
    npairs.add_rules({
      Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({'string','comment'})),
      Rule("$", "$", "lua")
        :with_pair(ts_conds.is_not_ts_node({'function'}))
    })

  -- npairs and completion
    local remap = vim.api.nvim_set_keymap

    -- skip it, if you use another global object
    _G.MUtils= {}

    vim.g.completion_confirm_key = ""

    MUtils.completion_confirm=function()
      if vim.fn.pumvisible() ~= 0  then
        if vim.fn.complete_info()["selected"] ~= -1 then
          require'completion'.confirmCompletion()
          return npairs.esc("<c-y>")
        else
          vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
          require'completion'.confirmCompletion()
          return npairs.esc("<c-n><c-y>")
        end
      else
        return npairs.autopairs_cr()
      end
    end

    remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
  -- ✓ npairs: Don't add pairs if it already have a close pairs in same line
    npairs.setup({
      enable_check_bracket_line = false
    })
  -- ✓ npairs: Don't add pairs if the next char is alphanumeric
    npairs.setup({
      ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
    })
  -- npairs: FastWrap (@TODO: seems not to work; maybe this helps https://vi.stackexchange.com/questions/2350/how-to-map-alt-key)
    npairs.setup({
      fast_wrap = {}, -- change default fast wrap example available on github too
    })



-- QUICK-SCOPE
  vim.api.nvim_command("highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline")
  vim.api.nvim_command("highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline")

