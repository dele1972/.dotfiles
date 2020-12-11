# Installation of ctags (Linux/Ubuntu)

This Installation Guide is based on [Installing universal-ctags on Ubuntu](https://gist.github.com/treyharris/e19bb74d72af432dd6984ad9907ae538#installing-universal-ctags-on-ubuntu) with slight modifications.

## 1. Create/Open the destination folder

```shell
mkdir ~/src
cd ~/src
```

## 2. Get the source and open ctags folder

```shell
git clone https://github.com/universal-ctags/ctags.git
cd ctags
```

## 3. Installation

```shell
./autogen.sh
make
sudo make install
update-alternatives --display ctags
update-alternatives --display etags
sudo update-alternatives --install /usr/bin/ctags ctags /usr/local/bin/ctags 50 --slave /usr/share/man/man1/ctags.1.gz ctags.1.gz /usr/local/share/man/man1/ctags.1
sudo update-alternatives --install /usr/bin/etags etags /usr/local/bin/ctags 50 --slave /usr/share/man/man1/etags.1.gz etags.1.gz /usr/local/share/man/man1/ctags.1
```

## 4. Check Installation

```shell
echo =ctags =etags
```

**result** → `/usr/local/bin/ctags /usr/bin/etags`

```shell
readlink -f =etags =ctags
```

**result**:

- `/usr/local/bin/ctags`
- `/usr/local/bin/ctags`

### Create Tag files (recursive)

```shell
ctags -R .
etags -R .
```

