" `packadd` to implement plugins via the vim package.
" The `!` prevents the plugin to be loaded by using `(n)vim --noplugin`.

"                *** NERD TREE 
" Plug 'preservim/nerdtree'
  packadd! nerdtree

  " additional: nerdtree-git
  " https://github.com/Xuyuanp/nerdtree-git-plugin
    "  Plug 'Xuyuanp/nerdtree-git-plugin'
    packadd! nerdtree-git-plugin

" additional: vim-devicons
" https://github.com/ryanoasis/vim-devicons
" see this project repo readme.md because of the needed installed font!
  " Plug 'ryanoasis/vim-devicons'
    packadd! vim-devicons


"                *** FZF - FUZZY (FILE) FINDER
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  packadd! fzf
  " Plug 'junegunn/fzf.vim'
  " set rtp+=~/
  packadd! fzf.vim

