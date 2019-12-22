# vimstorm
Vim config with PHPStorm-like functionality.

## Features
- Debugging (vdebug)
- Completion (deoplete + phpactor + deoplete-phpactor)
- Refactoring commands (phpactor)
  - Extract method
- Go to definition (phpactor)
- Linting (ale + php-language-server + phpstan)
  - php-language-server
  - phpstan
- Syntax checking (phpcs + phpmd)

## TODO
- Better completion
  - Reduce noise
  - Tailor to laravel
- Add key mappings
  - Add mappings for more phpactor functionality
    - Show references
    - Extract expressions
- ultisnips
  - Gives snippet completion suggestions

## Other included plugins worth mentioning
- nvim-yarp + vim-hug-neovim-rpc
  - Provides neovim plugin support for vim 8
- nerdtree
  - Show file tree sidebar like on a typical IDE
- tabulous
  - Number tabs for easy tab switching (ie: gt2 for tab 2)
- git-blame
  - To show last committer, time and message of line
- vim-signify
  - Show lines change since last commit
- fzf
  - Absolutely insanely fast fuzzy file searching.

Work in progress.
