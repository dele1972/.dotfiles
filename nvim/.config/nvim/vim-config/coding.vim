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

