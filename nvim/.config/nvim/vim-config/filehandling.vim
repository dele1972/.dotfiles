"                *** NERD TREE 
"
" 'scrooloose/nerdtree' becomes 'preservim/nerdtree'
" https://github.com/preservim/nerdtree
" https://vimawesome.com/plugin/nerdtree-red

" Config Section
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeIgnore = ['\.git$','^node_modules$']
  let g:NERDTreeStatusline = ''

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

  " nerdtree-git-plugin (https://github.com/Xuyuanp/nerdtree-git-plugin)
    let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0


"                *** FZF - FUZZY (FILE) FINDER
" Config Section
  " With a modified nnoremap - the original one is commented.
  " (https://rietta.com/blog/hide-gitignored-files-fzf-vim/)
  "nnoremap <C-p> :FZF<CR>
  nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \}
  " this is the fzf layout setting of ThePrimeagen
  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
  " ThePrimeagen set this to reverse list (https://youtu.be/73RulF4Md4Q?t=52)
  let $FZF_DEFAULT_OPTS='--reverse'


  " additional: ripgrep
  " https://github.com/BurntSushi/ripgrep
  " steps of this [article](https://dev.to/matrixersp/how-to-use-fzf-with-ripgrep-to-selectively-ignore-vcs-files-4e27):
  "   1. install ripgrep: `sudo apt-get install ripgrep`
  "   2. add some Environmentvars to your Shell ('~/.zshrc`, `~/.bashrc` or
  "   whatever you use):
  "      - `export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'`
  "      - `export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"`
  "      - `export FZF_DEFAULT_OPTS='--height 96% --reverse --preview \"cat {}"'`
  "      - `alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g \"!{node_modules,.git}" | fzf'`
  "   3. reload shell config (without restarting): `source ~/.zshrc` or `.~/.zshrc` (respectively with the config file of your used shell)
  "   4. add this command and nnoremap to your vim config:
  command! -bang -nargs=*  All
    \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
  nnoremap <silent> <leader>o :All<cr>

    " @ToDo: follow this `export FZF_DEFAULT_COMMAND` idea
      " https://stackoverflow.com/questions/61865932/how-to-get-fzf-vim-ignore-node-modules-and-git-folders
      " export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

    " @ToDo: follow the comment of the ripgrep blog
      " https://dev.to/dietrich/comment/haik
      " 1. set environment variable `RIPGREP_CONFIG_PATH` to a configfile (in addition to the `FZF_DEFAULT_COMMAND` options):
      "    - `--no-ignore-vcs`
      "    - `--hidden`
      " 2. generate a `~/.ignore` file (to avoid the additional `:All` mapping):
      "    - `.git/`
      "    - `node_modules/`

