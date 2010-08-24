" Vim resources:
" http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
" http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html

set nocompatible                  " Must come first because it changes other options.

filetype off                      " Needed on some linux distros.

silent! call pathogen#helptags() 
silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" Softtabs, two spaces
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set list listchars=tab:»·,trail:·" Display extra whitespace

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Ignore certian filetypes and directories
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc,*.tar,*.tgz,.git,public_html/images/**,public_html/upload/**,var/**,*/uploads/**,*/pear/**

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Or use vividchalk, molakai, github
colorscheme ir_black

" \\ for \ as the leader character
let mapleader = ","

" Launch vimrc with ,v and automatically load changes on write
autocmd bufwritepost .vimrc source $MYVIMRC
nmap <leader>v :tabedit $MYVIMRC<CR>

" ,w to save
nmap <leader>w :w<CR>

" ,q to quit (close window)
nmap <leader>q :quit<CR>
nmap <leader>qq :quitall<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Addtional ways to move between windows with ,
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l

" Focus MiniBufExplorer tabs and cycle with comma-tab (,Tab -> tab, tab, tab...)
nmap <leader><tab> :MiniBufExplorer<CR>

" Alt-tab between buffers with comma-comma-tab (,,Tab)
nmap <leader><leader><tab> <C-^>

" NERDTree shortcut ,d 
map <leader>d :NERDTreeToggle<CR>
map <leader><leader>d :NERDTreeClose<CR>:NERDTreeFind<CR>

" Tab mappings.
map <leader>tn :tabnew %<CR>
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove

" Visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" Uncomment to use Jamis Buck's file opening plugin
"map <leader>t :FuzzyFinderTextMate<CR>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;
"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Start new session with NERDTree opened
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
