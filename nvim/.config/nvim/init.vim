


"                *** quick-scope
  " Customize colors
    "highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    "highlight QuickScopePrimary guifg='#DE3163' gui=underline ctermfg=155 cterm=underline
    "highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    augroup qs_colors
      autocmd!
      autocmd ColorScheme * highlight QuickScopePrimary guifg='#DFFF00' gui=underline ctermfg=155 cterm=underline
      autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    augroup END
lua require 'init'

"                        ---> OLD INIT SETTINGS <---
"
"             @TODO: convert them to `init.lua` and replace init.vim
"                            by `lua/init.lua`



"                *** SETTINGS
  let g:elite_mode=1          " Enable Elite mode, NO ARROWS!
  " settings from the Primeagen
    " set noswapfile
    " set nobackup
    " set undodir=~/.config/nvim/undodir
    " set undofile
    " set scrolloff=8
    " set noshowmode
    " set signcolumn=yes
    " set noerrorbells
    " set updatetime=50
    " set shortmess+=c

  " Multiline movement in vmode
    xnoremap K :move '<-2<CR>gv=gv
    xnoremap J :move '>+1<CR>gv=gv

  " Map <Esc> to `jj` during insert mode
    " (see https://vim.fandom.com/wiki/Avoid_the_escape_key)
    inoremap jj <Esc>

  " Automatic toggling between line number modes
    " normal  - hybrid line numbers (relative numbers and current line shows the current line number)
    " insert  - static absolute line numbers
    set number relativenumber
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

  " wrap or not to wrap the lines
    ":set wrap						" To wrap lines visually, i.e. the line is still one line of text, but Vim displays it on multiple lines.
    :set nowrap						" To display long lines as just one line (i.e. you have to scroll horizontally to see the entire line)



"                *** NERD TREE 
  " 'scrooloose/nerdtree' becomes 'preservim/nerdtree'
  " https://github.com/preservim/nerdtree
  " https://vimawesome.com/plugin/nerdtree-red

  " Config Section
    autocmd FileType nerdtree setlocal relativenumber   " make sure relative line numbers are used

    " Automaticaly close nvim if NERDTree is only thing left open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Toggle
    " nnoremap <silent> <C-b> :NERDTreeToggle<CR>
    " Open NERDTree in the directory of the current file (or /home if no file is open)
    " https://superuser.com/a/868124
    nnoremap <silent> <C-b> :call NERDTreeToggleInCurDir()<CR>
    " nmap <silent> <C-i> :call NERDTreeToggleInCurDir()<cr>
    function! NERDTreeToggleInCurDir()
      " If NERDTree is open in the current buffer
      if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
      else
        exe ":NERDTreeFind"
      endif
    endfunction



"                *** GUTENTAGS
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



"                *** GOYO (distraction/presentation mode)
  nmap <F5> :call TogglePresentationMode()<CR>
  let g:presentationMode = 0
  function! TogglePresentationMode()
    set relativenumber! number! showmode! showcmd! hidden! ruler!
    if g:presentationMode
      " if on then turn off
      let g:presentationMode = 0
      if ! exists('#goyo')
        Goyo!
      endif
      noremap <Left> <Left>
      noremap <Right> <Right>
    else
      " if off then turn on
      let g:presentationMode = 1
      if ! exists('#goyo')
        Goyo
      endif
      noremap <Left> :silent bp<CR> :redraw!<CR>
      noremap <Right> :silent bn<CR> :redraw!<CR>
      nmap <F2> :call DisplayPresentationBoundaries()<CR>
      nmap <F3> :call FindExecuteCommand()<CR>

      " jump to slides
      nmap <F9> :call JumpFirstBuffer()<CR> :redraw!<CR>
      nmap <F10> :call JumpSecondToLastBuffer()<CR> :redraw!<CR>
      nmap <F11> :call JumpLastBuffer()<CR> :redraw!<CR>
    endif
  endfunction


  let g:presentationBoundsDisplayed = 0
  function! DisplayPresentationBoundaries()
    if g:presentationBoundsDisplayed
      match
      set colorcolumn=0
      let g:presentationBoundsDisplayed = 0
    else
      highlight lastoflines ctermbg=darkred guibg=darkred
      match lastoflines /\%23l/
      set colorcolumn=80
      let g:presentationBoundsDisplayed = 1
    endif
  endfunction


  " Automatically source an eponymous <file>.vim or <file>.<ext>.vim if it exists, as a bulked-up
    " modeline and to provide file-specific customizations.
    function! s:AutoSource()
        let l:testedScripts = ['syntax.vim']
        if expand('<afile>:e') !=# 'vim'
            " Don't source the edited Vimscript file itself.
            call add(l:testedScripts, 'syntax.vim')
        endif

        for l:filespec in l:testedScripts
            if filereadable(l:filespec)
                execute 'source' fnameescape(l:filespec)
            endif
        endfor

        call FindExecuteCommand()
    endfunction

  " adds a line of <
    nmap <leader>a :normal 20i<<CR>

  " makes Ascii art font
    nmap <leader>T :.!toilet -w 200 -f nancyj-fancy<CR>
    nmap <leader>F :.!toilet -w 200 -f standard<CR>
    nmap <leader>f :.!toilet -w 200 -f small<CR>
  " makes Ascii border
    nmap <leader>1 :.!toilet -w 200 -f term -F border<CR>


  function! FindExecuteCommand()
    let line = search('\S*!'.'!:.*')
    if line > 0
      let command = substitute(getline(line), "\S*!"."!:*", "", "")
      execute "silent !". command
      execute "normal gg0"
      redraw
    endif
  endfunction

  augroup AutoSource
      autocmd! BufNewFile,BufRead * call <SID>AutoSource()
  augroup END
