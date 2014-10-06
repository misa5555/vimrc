set number
set cursorline
set cmdheight=2
set showmatch
set helpheight=999

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set confirm
set hidden
set autoread
set nobackup
set noswapfile

set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
set mouse=a
set shellslash

set wildmenu wildmode=list:longest,full
set history=10000

syntax on
filetype on
filetype indent on
filetype plugin on

" copy to clipboard by yank
set clipboard=unnamed,autoselect

" stop generate un~ files
set noundofile

"----------------------------------------
" settings of neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

" make use of plugins in Github repository
NeoBundle 'tpope/vim-fugitive'

" make use of plugins outside of GitHub repository
"GitHub以外のGitリポジトリにあるプラグインを利用する場合
NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
"----------------------------------------
" NeoCompleteCache and NeoSnippet
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets.git'

"--------------------------------------------------------------------------
" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"--------------------------------------------------------------------------
" neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" jump and expand
imap ,,     <Plug>(neosnippet_expand_or_jump)
smap ,,     <Plug>(neosnippet_expand_or_jump)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" enable snip mates
let g:neosnippet#enable_snipmate_compatibility = 1
 
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" snnipet-setting various languages
NeoBundle 'honza/vim-snippets'

"--------------------------------------------------------------------------
" emmet-vim
NeoBundle 'mattn/emmet-vim'
"---------------------------------------------------------------------
" vim-endwise
NeoBundle 'tpope/vim-endwise'
"---------------------------------------------------------------------
" rails-vim
NeoBundle 'tpope/vim-rails'
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip
"---------------------------------------------------------------------
" add and remove comment out
NeoBundle "tyru/caw.vim.git"
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
"---------------------------------------------------------------------
" for javascript
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
"---------------------------------------------------------------------
" solarized dark settings
NeoBundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
"---------------------------------------------------------------------
" NERD Tree
NeoBundle 'scrooloose/nerdtree'

