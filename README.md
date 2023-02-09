# .dotfiles

New document status: **work in progress**

@TODO:

- [ ] translations
- [ ] change content
- [ ] change TOC

Here're my configuration files. Currently I'm managing these by using stow.

<a name="toc"></a>

## Table of Content
1. [Install stow](#install-stow)
1. [Use stow](#use-stow)
   1. [Add Something to stow](#somethingto-stow)
   1. [Add Files to stow](#addfiles-stow)
   1. [Unlink stow](#unlink-stow)
1. [TEMP - install nvim package plugins](#tmp-install-package)
1. [TEMP - Setup steps on a new machine](#tmp-new-machine)
1. [Links](#links)
1. [Subprojects](#subprojects)

## Installation Workflow for new machines

```bash
sudo apt-get update -y; sudo apt-get upgrade -y
```


### 1. Install ZSH

### 2. Install `stow`

```bash
sudo apt install -y stow
```

### 3. Install Rig-Rep

```bash
sudo apt-get install -y ripgrep
```

### 4. Clone `.dotfiles`

```bash
git clone git@github.com:dele1972/.dotfiles.git
```

### 5. Install FZF

#### a) get FZF by git submodule (after clone .dotfiles)

```bash
cd .dotfiles
git submodule update --init
```

#### b) put FZF in the right directory (`~/.fzf`) by using stow

```bash
stow --adopt -nvt ~ fzf   # test it
stow --adopt -vt ~ fzf    # stow it
```

#### c) install FZF

```bash
~/.fzf/install
```

##### Enable auto-completion/key bindings

If you enable *auto-completion* and *key bindings*:

```bash
Do you want to enable fuzzy auto-completion? ([y]/n) y
Do you want to enable key bindings? ([y]/n) y
```

... creates:

- `~/.fzf.bash`
- `~/.fzf.zsh`

##### Update shell configurtation files

```bash
Do you want to update your shell configuration files? ([y]/n) y

Update ~/.bashrc:
  - [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    + Added

Update ~/.zshrc:
  - [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    + Added

Finished. Restart your shell or reload config file.
   source ~/.bashrc  # bash
   source ~/.zshrc   # zsh

Use uninstall script to remove fzf.
```

For more information, see: https://github.com/junegunn/fzf

#### fzf als submodule im Verzeichnis fzf integrieren und als Namen .fzf verwenden

```bash
git submodule add --name .fzf https://github.com/junegunn/fzf.git fzf/.fzf
```

### 6. Install nvim

### 7. Setup nvim

Vorab Info: Es wird der nvim Packer verwendet. Diese config installiert beim nvim start automatisch den Packer in 
`~/.local/share/nvim/site/pack/packer/opt/packer.nvim`

#### Konfigurationsdateien per stow holen

```bash
cd .dotfiles
stow --adopt -nvt ~ nvim
stow --adopt -vt ~ nvim
```

#### nvim Plugins installieren

Dabei muss nvim mehrmals gestartet werden - mit erwarteten Fehlermeldungen

##### 1. Aufruf

```vim
:!git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
Klone nach '/home/lederich/.local/share/nvim/site/pack/packer/start/packer.nvim' ...

Fehler beim Ausführen von "~/dev/.dotfiles/nvim/.config/nvim/init.vim":
Zeile    1:
E5108: Error executing lua ~/.config/nvim/lua/statusline.lua:2: module 'lualine' not found:
Betätigen Sie die EINGABETASTE oder geben Sie einen Befehl ein
```

Dann erst `:PackerCompile` und anschließend `:PackerInstall` ausführen

Im ersten Rutsch werden nicht alle Plugins installiert:

```vim
✗ Failed to install prettier/vim-prettier
✗ Failed to install nvim-treesitter/playground
```
mit `q` aus dem Fenster und mit `:q` nvim beenden


##### 2. Aufruf

```vim
:!git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
Klone nach '~/.local/share/nvim/site/pack/packer/start/packer.nvim' ...

Betätigen Sie die EINGABETASTE oder geben Sie einen Befehl ein
```

In der Statuszeile werden noch Plugins komiliert und anschließend installiert, anschließend nvim mit `:q` beenden
(ggfs. `:PackerCompile` und anschließend `:PackerInstall` erneut ausführen)


##### Aktueller Fehler

wenn man in dev/.dotfiles nvim . und dann nvim/.config/nvim/lua/statusline/elianiva.lua öffnen will:

Fehler beim Ausführen von "function gutentags#setup_gutentags[63]..gutentags#ctags#init":                                                               
Zeile   25:
Executable 'ctags' can't be found. Gutentags will be disabled. You can re-enable it by setting g:gutentags_enabled back to 1.
Betätigen Sie die EINGABETASTE oder geben Sie einen Befehl ein



----

## OLD

@TODO

-[ ] (re)move or rewrite

<a name="install-stow"></a>

### Install stow  [↸](#toc)

`sudo apt install -y stow`

<a name="use-stow"></a>

### Use stow  [↸](#toc)

<a name="somethingto-stow"></a>

#### Add Something to stow

If the package/program/configuration folder is not stowed:

##### 1. create subfolders for the programs which should be stowed

*Syntax*:

```shell
{.dotfiles PROJECT-FOLDER}/{STOW-PACKAGENAME}/{WHAT TO STOW RELATIVE TO THE HOME DIRECTORY}
```

*Examples*:

- if you want to stow `~/.zshrc` as **zsh** stow package, create: `.dotfiles/zsh/.zshrc`
- if you want to stow `~/.config/nvim` as **nvim** stow package, create: `.dotfiles/nvim/.config/nvim`

##### 2. test stow

The stow command should be called in the project folder (in this case `.dotfiles`)

*Syntax*:
```shell
stow -nvt ~ <what to stow> <what to stow, whitespace sep.>
```

*Example*:
```shell
stow --adopt -nvt ~ zsh nvim
```

*Options*:  
`-n` .... 'simulate only' mode  
`-v` .... verbose  
`-S` .... stow (default not necessarey  
`-D` .... unstow  
`-t` .... target (home directory)  
`--adopt` force to overwrite  

##### 3. stow

```shell
stow --adopt -vt ~ zsh
```

<a name="addfiles-stow"></a>

#### Add Files to stow 

1. move/copy files to the corresponding `.dotfile` filestructure
2. rerun the `stow --adopt -vt ~ <stowpackagename>` at the `.dotfile` directory
   - maybe at first with the `n` option for testing

<a name="unlink-stow"></a>

#### Unlink stow  [↸](#toc)

`stow -vDt ~ zsh`

<a name="tmp-install-package"></a>

### TEMP - install nvim package plugins  [↸](#toc)

As an example I want to add the *fzf* plugin as *plugs-filehandler* package:

1. `cd .dotfiles/submodules/`
2. clone a plugin as submodule: `git submodule add https://github.com/junegunn/fzf`
3. create a symbolic link:
   1. `cd .dotfiles/nvim/.config/nvim/pack/plugs-filehandling/start`
   2. create link: `ln -s ../../../../../../submodules/fzf fzf`

<a name="tmp-new-machine"></a>

### TEMP - Setup steps on a new machine  [↸](#toc)

#### 1) clone this repo

#### 2) install stow

#### 3) Get Submodules (nvim only)

`git submodule update --init`

#### 4) Install ZSH

- [How to Install ZSH Shell on Ubuntu 18.04 LTS](https://linuxhint.com/install_zsh_shell_ubuntu_1804/)

#### 5) Install Oh-My-ZSH

- [github](https://github.com/ohmyzsh/ohmyzsh)

#### 6) Install NeoVim

##### Special NerdFonts are needed for nerdtree / devicons

```shell
mkdir -p ~/.local/share/fonts

cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

Fira won't work :(
Other usable Fonts will follow...
https://github.com/ryanoasis/nerd-fonts#font-installation

##### Install Fuzzy (File) Finder

`sudo apt-get install fzf`

#### 7) stow it

`stow --adopt -vt ~ nvim`

### TMP - To update submodules

`git submodule foreach git pull origin master`

<a name="links"></a>

### Links  [↸](#toc)

- A list of [.dotfiles](http://dotfiles.github.io/) - feel free to try some configurations which are published there.
- This is the *dotfiles* Repo of [Leeren](https://github.com/leeren/dotfiles/) - have a look at the *git submodule* configuration for the *nvim* plugins.
- A beginner friendly introducing video to stow: [Sync your .dotfiles with git and GNU #Stow like a pro!](https://youtu.be/CFzEuBGPPPg) ([DevInsideYou](https://www.youtube.com/channel/UCSBUwLT9zXhUalKfJrc2q2A), 01.12.2019)

<a name="subprojects"></a>

### Subprojects  [↸](#toc)

My 'Projects' which are handled by my *stow* configuration:

- [My (Neo-)Vim configuration](./doc/my-nvim-configuration.md)

