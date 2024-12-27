" We don't need to be compatible with vi
set nocompatible

" Remap the leader key to ,
let mapleader=','
" Check the leader is working by using ,t
nnoremap <leader>t :echo("\<leader\> works! It is set to <leader>")<CR>

" Enable pathogen for easy plugin management
call pathogen#infect()

set title

" Set tab options
set tabstop=4 " How may columns are displayed for a tab
set shiftwidth=4 " How many columns are used with >> and <<
set softtabstop=4 " How many columns to insert when tab is used
set expandtab " Use spaces instead of tabs
set smarttab " Backspace and tab use shiftwidth for columns
set shiftround " Shifting using >> or << aligns to tabs

" Indenting options
set autoindent
" set smartindent

" " If we forget to open a file using sudo, use w!! to save the file.
cmap w!! w !sudo tee % >/dev/null

" Turn on syntax highlighting
syntax on

" ColourScheme
" Setting set t_Co=256 causes highlighting not to show
"set t_Co=256

set background=dark

" Many Colours don't set using the following check with :hi
let g:hybrid_use_Xresources = 1

colorscheme hybrid
"colorscheme jellybeans
"colorscheme base16-default
"colorscheme base16-default-dark

"Set the background colour to be the same as the terminal
highlight Normal ctermbg=black

" CtrlP
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'CtrlPMixed'

" Turn on for plugin indenting with syntastic
filetype plugin on
filetype indent on

" Allow up to 15 vim tabs
set tabpagemax=15

" Don't use a backup or swp file
set nowb "Don't backup a file before overwriting it
set nobackup "Don't backup a file after overwriting it
set noswapfile "Don't create .swp files

" Remap space for folding
nnoremap <space> za
vnoremap <space> zf

" paste mode toggle
nnoremap <F3> :set invpaste<CR>
set pastetoggle=<F3>

" set showmode

" Turn on max line length according to pep8 is 79
"set textwidth=79

" Line Numbers
" set number

" Fold based on indent
"set foldmethod=indent
"set foldnestmax=1

" Change parenthesis highlighting
:hi MatchParen cterm=underline ctermbg=none ctermfg=none

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets = '<f2>'
let g:UltiSnipsEditSplit = 'horizontal'
nmap <f2> :UltiSnipsEdit<CR>

" .md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" .json is json
au! BufRead,BufNewFile *.json set filetype=json

" html is html
au! BufRead,BufNewFile *.html set filetype=html

" yml is yaml
" au! BufRead,BufNewFile *.yml set filetype=yaml

" Syntastic
"let g:syntastic_html_checkers=['w3']

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" Tabstop differences based on filetype
au FileType snippets setlocal ts=2 sw=2 sts=0 noexpandtab
au FileType puppet setlocal ts=2 sw=2 sts=2 et
au FileType python setlocal ts=4 sw=4 sts=4 et
au FileType yaml setlocal ts=2 sw=2 sts=2 et
au FileType json setlocal ts=2 sw=2 sts=2 et
au FileType html setlocal ts=2 sw=2 sts=2 et
au FileType javascript setlocal ts=2 sw=2 sts=2 et
au FileType jsx setlocal ts=2 sw=2 sts=2 et
au FileType tf setlocal ts=2 sw=2 sts=2 et

" Show special characters
"":set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
:set listchars=tab:>·,trail:~,extends:>,precedes:<
:set list

" Gundo.  Requires Vim 7.3
nnoremap <F5> :GundoToggle<CR>

"Tabularize
" ,p will align the puppet style =>
nnoremap <leader>> :Tabularize /=><CR>
vnoremap <leader>> :Tabularize /=><CR>
nnoremap <leader>= :Tabularize /=<CR>
vnoremap <leader>= :Tabularize /=<CR>

"NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close nerd tree after you create/open a file
let NERDTreeQuitOnOpen=1

"neocomplcache
" Launches neocomplcache automatically on vim startup.
"let g:neocomplcache_enable_at_startup = 1
"
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" let g:neocomplcache_enable_auto_select = 1
" inoremap <expr><TAB> neocomplcache#close_popup() . "\<TAB>"
"inoremap <expr><TAB>  neocomplcache#close_popup()

"puppetlint
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check --no-class_inherits_from_params_class-check'

" Add : to the word boundry, for those class::seperators
set iskeyword-=:

"Format terraform files on save
"let g:terraform_fmt_on_save=1
let g:terraform_align=1

"Automatically remove any trailing writespace on save
autocmd BufWritePre * %s/\s\+$//e

"lightline - remove the colour from the bar
let g:lightline = { 'colorscheme': 'powerline' }
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
