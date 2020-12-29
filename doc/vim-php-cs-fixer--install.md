# Installation of vim-php-cs-fixer (Linux/Ubuntu)

## Installation of `php-cs-fixer` is necessary

```shell
curl -L https://cs.symfony.com/download/php-cs-fixer-v2.phar -o php-cs-fixer
sudo chmod a+x php-cs-fixer
sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
```

## Set PHP Path in `.dotfiles/nvim/.config/nvim/vim-config/coding.vim`

```
      let g:php_cs_fixer_php_path = "/opt/lampp/bin/php"               " Path to PHP
```

This is my lampp php path: /opt/lampp/bin/php

But I have to make a s-link too:

```shell
sudo ln -s /opt/lampp/bin/php /usr/bin/php
```

