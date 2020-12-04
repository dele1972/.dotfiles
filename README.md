# .dotfiles
My home dotfiles to stow

<a name="toc"></a>

## Table of Content
1. [Install stow](#install-stow)
1. [Use stow](#use-stow)
   1. [Unlink stow](#unlink-stow)
1. [TEMP - install nvim package plugins](#tmp-install-package)
1. [Links](#links)

<a name="install-stow"></a>

## Install stow  [↸](#toc)

`sudo apt install -y stow`

<a name="use-stow"></a>

## Use stow  [↸](#toc)

1. create subfolders for the programs which should be stowed (`.dotfiles/zsh/.zshrc`)
2. test stow

`stow -nvt ~ <what to stow> <what to stow, whitespace sep.>`
`stow --adopt -nvt ~ zsh nvim`
`-n` .... 'simulate only' mode
`-v` .... verbose
`-S` .... stow (default not necessarey
`-D` .... unstow
`-t` .... target (home directory)
`--adopt` force to overwrite

3. stow

`stow --adopt -vt ~ zsh`

<a name="unlink-stow"></a>

### Unlink stow  [↸](#toc)

`stow -vDt ~ zsh`

<a name="tmp-install-package"></a>

## TEMP - install nvim package plugins  [↸](#toc)

As an example I want to add the *fzf* plugin as *plugs-filehandler* package:

1. `cd .dotfiles/submodules/`
2. clone a plugin as submodule: `git submodule add https://github.com/junegunn/fzf`
3. create a symbolic link:
   1. `cd .dotfiles/nvim/.config/nvim/pack/plugs-filehandling/start`
   2. create link: `ln -s ../../../../../../submodules/fzf fzf`

<a name="links"></a>

## Links  [↸](#toc)

- A list of [.dotfiles](http://dotfiles.github.io/) - feel free to try some configurations which are published there.
- This is the *dotfiles* Repo of [Leeren](https://github.com/leeren/dotfiles/) - have a look at the *git submodule* configuration for the *nvim* plugins.
- A beginner friendly introducing video to stow: [Sync your .dotfiles with git and GNU #Stow like a pro!](https://youtu.be/CFzEuBGPPPg) ([DevInsideYou](https://www.youtube.com/channel/UCSBUwLT9zXhUalKfJrc2q2A), 01.12.2019)

