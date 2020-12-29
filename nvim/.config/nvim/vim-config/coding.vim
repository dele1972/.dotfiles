"                *** COMMENTARY (tpope)
" https://github.com/tpope/vim-commentary
" 
" commands:
" 
"   `gcc` ............... to comment out a line
"   `gc` ................ normal mode: comment out the target of a motion (for example, `gcap` to comment out a paragraph)
"                         visual mode: comment out the selection
"   command-mode
"   :7,17Commentary ..... comment out in the range of line 7 to line 17
"   :g/hello/Commentary   comment each line with the occurance of 'hello'

  " function from https://github.com/ChristianChiarulli/nvim/blob/master/plug-config/vim-commentary.vim
  function! Comment()
    if (mode() == "n" )
      execute "Commentary"
    else    
      execute "'<,'>Commentary"
    endif
   endfunction
  vnoremap <silent> <space>/ :call Comment()

  " @ToDo: create a shell keybinding like [Brodie Robertson](https://youtu.be/6BZ-QL_9qcA)
    " He binds <ctrl> + / to the chars: gc
    " for zsh here is a bind 'how tond': https://stackoverflow.com/a/28938270


"                *** GIT IMPLEMENTATION 
  " config of [ThePrimeagen](https://youtu.be/PO6DxfGPQvw?t=98)
    " vim-fugitive
    " https://github.com/tpope/vim-fugitive
    "
    " commands:
    "   :G                      git status
    "                             s - toggle to staged
    "                             u - toggle to unstaged
    "                             dv  on the file to resolve for resolving merge conflicts
    "                                 jump to the '<<<<<<HEAD' line
    "                                 :diffget //2    take the selection of the left side
    "                                 :diffget //3    take the selection of the right side
    "                                 or change manually in the middle
    "                                 end merging of this file by closing the window: <ctrl>+w <ctrl>+o
    "                                 (after that coc restart is neccessary `:CocRestart`)
    "   :Gcommit                starts commit editor screen, with :wq the commit is done
    "   :Gpush                  push to origin
    "   :Git merge <ToBranch>   ddd
      nmap <leader>gj :diffget //3<CR>
      nmap <leader>gf :diffget //2<CR>
      nmap <leader>gs :G<CR>

    " fzf-checkout (https://youtu.be/73RulF4Md4Q?t=52)
    " https://github.com/stsewd/fzf-checkout.vim
    "
    " commands:
    "   :GCheckout              opens fzf like window with branches listet
    "                             select by typing fzf like the branch name
    "                             <ctrl>+d    delete the selected branch
    "                             <alt><cr>   switch to remote branch and track it locally
    "                             create, merge, rebase is possible too
    "   :h fzf-checkout         further information
    "
      nnoremap <leader>gc :GCheckout<CR>

  " vim-signify
    set updatetime=100

"                *** CODE NAVIGATION
  " vim-gutentags
    " commands
      " <C-]> ... <ontrol> + <AltGr> + 9   jump to definition
      " <C-t> ...........................  jump back
      " https://andrew.stwrt.ca/posts/vim-ctags/
    " Following configurations are recommendations of [How to setup ctags with gutentags properly for almost every language](https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/)
    " help Gutentags to find project root
    let g:gutentags_add_default_project_roots = 0
    let g:gutentags_project_root = ['package.json', '.git']
    "prevent creation of `tags` and `tags.lock` files in the project dir
    "(result: no gitignore needed for that)
    let g:gutentags_cache_dir = expand('~/.cache/nvim/ctags/')
    " command to clear the cache
    " command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
    " tell Gutentags when it has to update the tags
    let g:gutentags_generate_on_new = 1
    let g:gutentags_generate_on_missing = 1
    let g:gutentags_generate_on_write = 1
    let g:gutentags_generate_on_empty_buffer = 0
    " let Gutentags generate more info for the tags
    "   - `a` ... Access (or export) of class members
    "   - `i` ...  Inheritance information
    "   - `l` ...  Language of input file containing tag
    "   - `m` ...  Implementation information
    "   - `n` ...  Line number of tag definition
    "   - `S` ...  Signature of routine (e.g. prototype or parameter list)"
    let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
    " Making Gutentags faster by ignoring a lot of unnecessary filetypes
    let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]


"                *** INTELLISENSE
function! GoYCM()
  nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
  nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
  nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<CR>
endfunction

function! GoCoc()
  inoremap <buffer> <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()

  inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <buffer> <silent><expr> <C-space> coc#refresh()

  " GoTo code navigation.
  nmap <buffer> <leader>gd <Plug>(coc-definition)
  nmap <buffer> <leader>gy <Plug>(coc-type-definition)
  nmap <buffer> <leader>gi <Plug>(coc-implementation)
  nmap <buffer> <leader>gr <Plug>(coc-references)
  nnoremap <buffer> <leader>cr :CocRestart
endfunction

autocmd FileType typescript :call GoYCM()
autocmd FileType cpp, cxx,h,hpp,c,php :call GoCoc()


"                *** PHP
" https://thevaluable.dev/vim-php-ide/
" php.vim     			https://github.com/StanAngeloff/php.vim
" vim-php-cs-fixer	https://github.com/stephpy/vim-php-cs-fixer
" ncm2			        https://github.com/ncm2/ncm2
" phpactor		      https://github.com/phpactor/phpactor
" ncm2-phpactor		  https://github.com/phpactor/ncm2-phpactor
  function! GoPHP()
    " php.vim
      let g:php_version_id = 70408  " currently my lampp has got PHP Version 7.4.8
      let b:php_version_id = 70408  " currently my lampp has got PHP Version 7.4.8
      let g:php_syntax_extensions_enabled = ["bcmath", "bz2", "core", "curl", "date", "dom", "ereg", "gd", "gettext", "hash", "iconv", "json", "libxml", "mbstring", "mcrypt", "mhash", "mysql", "mysqli", "openssl", "pcre", "pdo", "pgsql", "phar", "reflection", "session", "simplexml", "soap", "sockets", "spl", "sqlite3", "standard", "tokenizer", "wddx", "xml", "xmlreader", "xmlwriter", "zip", "zlib"]
      let g:php_var_selector_is_identifier = 1  " include the dollar sign $ as part of the highlighting group for a PHP variable
    " vim-php-cs-fixer
      " If php-cs-fixer is in $PATH, you don't need to define line below
      " let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar

      " If you use php-cs-fixer version 1.x
      let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
      let g:php_cs_fixer_config = "default"                  " options: --config
      " If you want to define specific fixers:
      "let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
      "let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
      " End of php-cs-fixer version 1 config params

      " If you use php-cs-fixer version 2.x
      let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
      "let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
      "let g:php_cs_fixer_config_file = '.php_cs' " options: --config
      " End of php-cs-fixer version 2 config params

      let g:php_cs_fixer_php_path = "/opt/lampp/bin/php"               " Path to PHP
      let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
      let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
      let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
      nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
      nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
    " ncm2
      let g:python3_host_prog="/usr/bin/python3/"
        " Optional Vimrc Tips
          " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
          " found' messages
          set shortmess+=c

          " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
          inoremap <c-c> <ESC>

          " When the <Enter> key is pressed while the popup menu is visible, it only
          " hides the menu. Use this mapping to close the menu and also start a new
          " line.
          inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

          " Use <TAB> to select the popup menu:
          inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
          inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

          " wrap existing omnifunc
          " Note that omnifunc does not run in background and may probably block the
          " editor. If you don't want to be blocked by omnifunc too often, you could
          " add 180ms delay before the omni wrapper:
          "  'on_complete': ['ncm2#on_complete#delay', 180,
          "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
          au User Ncm2Plugin call ncm2#register_source({
                  \ 'name' : 'css',
                  \ 'priority': 9,
                  \ 'subscope_enable': 1,
                  \ 'scope': ['css','scss'],
                  \ 'mark': 'css',
                  \ 'word_pattern': '[\w\-]+',
                  \ 'complete_pattern': ':\s*',
                  \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
                  \ })
    " ncm2-phpactor
      autocmd BufEnter * call ncm2#enable_for_buffer()
      set completeopt=noinsert,menuone,noselect
  endfunction

  function! PhpSyntaxOverride()
    " Put snippet overrides in this function.
    hi! link phpDocTags phpDefine
    hi! link phpDocParam phpType
  endfunction

  augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
    autocmd FileType php call GoPHP()
    autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()   " vim-php-cs-fixer: add fix on save functionality
  augroup END
