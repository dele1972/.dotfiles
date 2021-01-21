" THEME DRACULA 
  " Plug 'dracula/vim'
  " https://github.com/dracula/vim
  " NOTE: after cloning I have to use `git mv vim vim-dracula`
  " packadd! vim-dracula

" gruvbox (morhetz)
  " https://github.com/morhetz/gruvbox
  " for cholor sheme
  "Plug 'morhetz/gruvbox'
  packadd! gruvbox

" *** ADDING HELPTAGS
command! -nargs=0 -bar Helptags
    \  for p in glob('~/.config/nvim/pack/plugs-theme/opt/*', 1, 1)
    \|     exe 'packadd ' . fnamemodify(p, ':t')
    \| endfor
    \| helptags ALL
