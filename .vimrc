" set:  
" let:
" map: recursive mappping (also) 
" noremap: not recursive mapping
" nmap: only normal mode
" nnoremap: only normal mode
" vmap: only visual mode
" vnoremap: only visual mode


set nocompatible " Allows for non-compatibility with vi
filetype indent plugin on
syntax on
set wildmenu

" Information of the file
set relativenumber
set nu
set ruler " Show current position at the end of the file
set showcmd " Show commands you are inserting at the end of the file
set showmatch " Show matching brackets when text indicator is over them

" Search
set incsearch " Incremental search
set ignorecase " Not case sensitive
set smartcase " Case sensitive when capital letter appears
set wrapscan " From the end go to the begining 

" Spaces and tabs
set tabstop=4 " When indenting with > four spaces width 
set softtabstop=4
set shiftwidth=4 " When pressing tab four spaces width
set noexpandtab " Use tabs not spaces
set autoindent " Indentation of the current line to the next
set smartindent " Reacts to the syntax/style you use

" Dialogue
set confirm " When q and not w asks for confirmation
set noerrorbells " No bells on erros
set novisualbell " No blinks on errors
set noeb vb t_vb=


" Mappings
let mapleader=" "
nnoremap <SPACE> <Nop>
" Replace current word and go on
nnoremap <Leader>r *``cgn 
nnoremap <Leader>rw /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>R :%s/\<<C-r><C-w>\>//g<Left><Left>
" Write and quit
nnoremap <Leader>q :q<ENTER>
nnoremap <Leader>w :wq<ENTER>
" Open vertical split
nnoremap <Leader>v :vsp . <ENTER>
" Navigate splits
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
" Compilation
nnoremap <Leader>m :make <ENTER>
nnoremap <Leader>c :cwindow <ENTER>



" Jump to the last line when opening
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

 """"""""""""""""""""""""""""
 " Folding
 """"""""""""""""""""""""
 " No highlighting
 hi! link Folded Normal
 set foldtext=getline(v:lnum)

 " Save foldings
 autocmd BufWinLeave *.* mkview
 autocmd BufWinEnter *.* silent loadview
 nnoremap <Leader>f zfi{

 au BufNewFile,BufRead *.cu set ft=cuda
 au BufNewFile,BufRead *.cuh set ft=cuda

"""""""""""""""""""""""""
" Edit files
"""""""""""""""""""""""""
fun! DoSomething( ) 
	%s/,/./g
	%s/	/,/g
	:g/^\s*$/d
endfunction

command FormatCsv call DoSomething( )

" Copy to clipboard
set clipboard=unnamedplus

 
 """"""""""""""""""""""""
 " Pylint
 """"""""""""""""""""""""
let g:ale_linters = {
     \   'python': ['pylint'],
\}
let g:ale_python_pylint_options = '--rcfile /home/albertomanzano/Documents/Thesis/Quantum/FinancialApplications/FinancialApplications/misc/pylint.rc'
let g:ale_echo_msg_format='[%linter%] [%severity%] %code% %s'

