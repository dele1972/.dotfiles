  " presentation mode
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

