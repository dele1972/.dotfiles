# Installation of YouCompleteMe (Linux/Ubuntu)

## update YouCompleteMe

This package needs further submodules which must also be updated

```shell
cd ~/.dotfiles/submodules
git submodule update --init --recursive
```

## installation

This package needs an installation. If *cmake* is not installed this should be installed first.

```shell
sudo apt-get install cmake
cd ~/dev/.dotfiles/submodules/YouCompleteMe
python3 install.py --all
```

## Errors by starting (n)vim?

### YouCompleteMe unavailable: No module named ycmd

Read the above description about updating and installing YouCompleteMe ;)

### [coc.nvim] "node" is not executable, checkout https://nodejs.org/en/download/

Install node.js ...

https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04
https://stackoverflow.com/a/24830607
