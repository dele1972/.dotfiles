# linux - update nvim to nightly

[neovim](https://github.com/neovim/neovim)

## 1) Remove (apt) installed neovim

```shell
sudo apt-get remove neovim
```

## 2) Download `nvim.appimage`

[Download page](https://github.com/neovim/neovim/releases/tag/v0.5.0) --> download `nvim.appimage`

## 3) Perform suggested next steps

Make it executable and start neovim

```shell
chmod u+x nvim.appimage && ./nvim.appimage
```

## 4) copy to usr/bin

- place global
- in current path, so it is everywhere executable

[source](https://www.reddit.com/r/SolusProject/comments/iguvn6/how_can_i_install_neovim_nightly/g2wmjrk?utm_source=share&utm_medium=web2x&context=3)

```shell
sudo mv nvim.appimage /usr/bin/nvim
```

## install packer and build 1st config

- [Configuring Neovim using Lua](https://icyphox.sh/blog/nvim-lua/)
- [Getting Started with Neovim](https://bryankegley.me/posts/nvim-getting-started/)

## install ripgrep

Ubuntu >18.10

```bash
sudo apt-get install ripgrep
```

## install fzf

```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Packages installed

~ https://github.com/dele1972/.dotfiles/tree/main/nvim/.config/nvim

sources:
- Bryan Kegley
  - https://bryankegley.me/posts/nvim-getting-started/
- ThePrimeagen
  - [Tech Weekly #7 | NeoVim TreeSitter](https://youtu.be/xQGbhiUbSmM)

|   | git package | info | inspired by |
|---|-------------|------|-------------|
| ✔ | [pwbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) | package manager in lua | Bryan Kegley |
| ✔ | [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | treesitter | Bryan Kegley |
| ✔ | [nvim-treesitter/playground](https://github.com/nvim-treesitter/playground) | treesitter addon, View treesitter information directly in Neovim!  | ThePrimeagen |
| ? | sheerun/vim-polyglot | for treesitter? | Bryan Kegley |
| ✔ | [tjdevries/colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim) | run gloombuddy theme | Bryan Kegley |
| ✖ | bkegley/gloombuddy | themes for better treesitter? | Bryan Kegley |
| ✔ | prettier/vim-prettier | formatter | Bryan Kegley |
| ✔ | neovim/nvim-lspconfig | LSP | Bryan Kegley |
| ✔ | nvim-lua/completion-nvim | LSP? | Bryan Kegley |
| ? | anott03/nvim-lspinstall | LSP? | Bryan Kegley |
| ? | nvim-lua/popup.nvim | Fuzzy Finding | Bryan Kegley |
| ? | nvim-lua/plenary.nvim | Fuzzy Finding | Bryan Kegley |
| ? | nvim-lua/telescope.nvim | Fuzzy Finding | Bryan Kegley |
| ? | jremmen/vim-ripgrep | Fuzzy Finding | Bryan Kegley |
| ✖ | junegunn/fzf | | |
| ✖ | junegunn/fzf.vim | | |
| ✔ | [gruvbox-community/gruvbox](https://github.com/gruvbox-community/gruvbox) | gruvbox | ThePrimeagen |
| ✔ | [preservim/nerdtree](https://github.com/preservim/nerdtree) | nerdtree | |
| ✔ | [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) | nerdtree-git-plugin | |
| ✖ | [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons) | vim-devicons	- OLD | |
| ✔ | [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) | LUA | |
| ✖ | [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline) | vim-airline | |
| ✔ | statusline | nvim configuration | |
| ✔ | [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) | vim-fugitive | ThePrimeagen |
| ✖ | [stsewd/fzf-checkout.vim](https://github.com/stsewd/fzf-checkout.vim) | fzf-checkout.vim | |
| ✖ | [Townk/vim-autoclose](https://github.com/Townk/vim-autoclose) | vim-autoclose OLD | |
| ✔ | [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) | windwp/nvim-autopairs	- LUA | |
| ✖ | [tpope/vim-commentary](https://github.com/tpope/vim-commentary) | vim-commentary - OLD comment line/section | |
| ✔ | [b3nj5m1n/kommentary](https://github.com/b3nj5m1n/kommentary)	| LUA comment line/section | |
| ✔ | [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | git editor addon for decorations and actions, required for statusline | |
| ~ | [hoob3rt/lualine.nvim](https://github.com/hoob3rt/lualine.nvim) | A blazing fast and easy to configure neovim statusline written in pure lua | |
| ✔ | [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) | vim-gutentags - ctags handling | |
| ✔ | [markonm/traces.vim](https://github.com/markonm/traces.vim) | traces.vim	- regex, show matches instantly, lua? | |
| ✔ | [unblevable/quick-scope](https://github.com/unblevable/quick-scope/) | quick-scope - helps to get to any word on a line in two or three keystrokes with Vim's built-in find char | |
| ✔ | [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim) | goyo.vim - presentation mode, lua? | |
| ~ | [wikitopian/hardmode](https://github.com/wikitopian/hardmode/) | hardmode - learn vim by the hard way..., lua? | |
| ~ | [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)	| +++, A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Lua | |
| ~ | [sirver/ultisnips](https://github.com/sirver/ultisnips) | +++, UltiSnips is the ultimate solution for snippets in Vim | |

PHP LSP integration!
-	  " https://thevaluable.dev/vim-php-ide/
-	  packadd! php.vim		- ARCHIVED https://github.com/StanAngeloff/php.vim/
-	  packadd! vim-php-cs-fixer	- https://github.com/stephpy/vim-php-cs-fixer/
-	  packadd! ncm2			- https://github.com/ncm2/ncm2/
-	  packadd! phpactor		- https://github.com/phpactor/phpactor/
-	  packadd! ncm2-phpactor	- https://github.com/phpactor/ncm2-phpactor
-	    packadd! nvim-yarp		- https://github.com/roxma/nvim-yarp/

----

## LSP

### LSP - install tsserver

```vim
:LspInstall tsserver
```

#### LSP - tsserver doesn't startup

```node
npm install -g typescript typescript-language-server
```

[source](https://github.com/neovim/nvim-lspconfig/issues/260#issuecomment-811815613)

### ins-complete

@TODO: **currently :command completion doesn't work as popup - suggestions will be viewed horizontal :(**

1. `configs.lua` ~#111 attachs language servers - this could be one point, to have ins-complete set up if no server/filetype is set (but is the command mode an own buffer?)
1. In my old nvim 0.4.3 configuration and during the update this menu thing for :command complete was working (which plugin/option prevent the menu?)

#### Links

- [How to Configure and Use Auto-Complete with Vim](https://linuxhint.com/vim_auto_complete/)
- VIM: [cmdline-completion](http://vimdoc.sourceforge.net/htmldoc/cmdline.html#cmdline-completion)

----

## Links

- https://alexpearce.me/2016/02/managing-dotfiles-with-stow/
  - stow --adopt --verbose=3 -n -t nvim nvim
- [Getting started using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide)
  - [vimapinvim_exec](https://github.com/nanotee/nvim-lua-guide#vimapinvim_exec)
- [Configuring Neovim using Lua - And switching from init.vim to init.lua](https://icyphox.sh/blog/nvim-lua/)
- Khue Doan: [How to convert Neovim config from init.vim to init.lua](https://www.khuedoan.com/posts/convert-from-init-vim-to-init-lua/)
- **HAVE A LOOK**
  -[Neovim 0.5: Lua, built in LSP, Treesitter and the best plugins for 2021](https://benfrain.com/neovim-0-5-lua-built-in-lsp-treesitter-and-the-best-plugins-for-2021)
  - [Supercharging Vim: Blazing fast search and global replace](https://www.mattlayman.com/blog/2019/supercharging-vim-blazing-fast-search/)
  - [Nvim online :help](https://neovim.io/doc/user/index.html)
  - [Navigator](https://github.com/ray-x/navigator.lua)
  	- Easy code navigation, view diagnostic errors, see relationships of functions, variables
  - PHP
    -[Setting Up Vim and the Php Language Server Protocol](https://camilopayan.com/posts/setting-up-vim-and-the-php-language-server-protocol/)
  - Emmet
  	- https://github.com/aca/emmet-ls
