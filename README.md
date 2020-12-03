# .dotfiles
My home dotfiles to stow

## Install stow

`sudo apt install -y stow`

## stow

1. create subfolders for the programs which should be stowed (.dotfiles/zsh/.zshrc)
2. test stow

stow -nvt ~ <what to stow> <what to stow, whitespace sep.>
stow --adopt -nvt ~ zsh nvim
-n 'simulate only' mode
-v verbose
-S stow (default not necessarey
-D unstow
-t target (home directory)
-- adopt force to overwrite

3. stow
stow --adopt -vt ~ zsh

### unlink

stow -vDt ~ zsh

