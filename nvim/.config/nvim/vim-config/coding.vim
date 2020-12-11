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

