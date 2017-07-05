map <F1> :cp<CR>
map <F2> :cn<CR>
map <F4> :A<CR>
map <F11> :!g++ -std=c++0x % -o %.elf && ./%.elf<CR>
map <F12> :make -j2<CR>

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

map <F3> :Gblame<CR>
map <F5> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --exclude="*.js" --exclude="*.php" --exclude="*.tpl" .<CR>

set tags+=./tags

set undofile
set undodir=~/.vim/.undo,~/tmp,/tmp
set nocursorline
set novisualbell
colorscheme wombat256
"colorscheme jellybeans
set list

set listchars=tab:»\ ,trail:·,extends:#,nbsp:·

nnoremap n n
nnoremap N N

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
