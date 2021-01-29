"                *** COMMENTARY (tpope)
" https://github.com/tpope/vim-commentary
  " Plug 'tpope/vim-commentary'
  packadd! vim-commentary



"                *** GIT IMPLEMENTATION
  " vim-fugitive (tpope)
  " Plug 'tpope/vim-fugitive'
  packadd! vim-fugitive

  " vim-airline
  " shows also the current branch in the bottom vim info line
  " Plug 'tpope/vim-airline'
  " https://github.com/vim-airline/vim-airline
  " Plug 'bling/vim-airline'
  packadd! vim-airline

  " fzf-checkout
  " https://github.com/stsewd/fzf-checkout.vim
  " Plug 'stsewd/fzf-checkout.vim'
  packadd! fzf-checkout.vim

  " vim-signify
  packadd! vim-signify




"                *** CODE NAVIGATION
  " vim-gutentags (ctags handling)
  packadd! vim-gutentags

  " quick-scope
  packadd! quick-scope


"                *** 'INTELLISENSE'
  " YouCompleteMe (awsome for TS)
  " packadd! YouCompleteMe

  " coc (awsome for all other)
  packadd! coc.nvim


"                *** TSLINT
  packadd! coc-tsserver
  packadd! coc-tslint-plugin
  packadd! coc-prettier


"                *** PHP
  " https://thevaluable.dev/vim-php-ide/
  packadd! php.vim
  packadd! vim-php-cs-fixer
  packadd! ncm2
  packadd! phpactor
  packadd! ncm2-phpactor
    packadd! nvim-yarp

" *** ADDING HELPTAGS
command! -nargs=0 -bar Helptags
    \  for p in glob('~/.config/nvim/pack/plugs-coding/opt/*', 1, 1)
    \|     exe 'packadd ' . fnamemodify(p, ':t')
    \| endfor
    \| helptags ALL
