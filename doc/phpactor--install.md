# Installation of phpactor (Linux/Ubuntu)

## composer needed

```shell
curl -L https://getcomposer.org/composer-stable.phar -o composer
sudo chmod a+x composer
sudo mv composer /usr/local/bin/composer
```

## install phpactor

```shell
cd .dotfiles/submodules/phpactor
composer install
sudo ln -s ~/dev/.dotfiles/submodules/phpactor/bin/phpactor /usr/local/bin/phpactor
```

### check phpactor

```shell
phpactor status
```

