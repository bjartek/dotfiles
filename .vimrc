"Inspiration:
"https://github.com/captbaritone/dotfiles/blob/master/vimrc

"load plug vim if we do not have it yet
if empty(glob('~/.vim/autoload/plug.vim'))
   !mkdir -p ~/.vim/autoload/
    !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

Plug 'editorconfig/editorconfig-vim'
"Plug 'tpope/vim-sensible' "base sensible options

Plug 'bling/vim-airline' "nicer status line
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'altercation/vim-colors-solarized' "pretty colors
Plug 'nanotech/jellybeans.vim'
Plug 'fatih/molokai'

"use fzf with rg
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'                 " search across files
let g:ackprg = 'rg --vimgrep --hidden'

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

Plug 'ctrlpvim/ctrlp.vim' "find files
let g:ctrlp_user_command = 'rg --files --hidden %s'

Plug 'tpope/vim-unimpaired' "navigage in files

Plug 'elzr/vim-json', { 'for': 'json' } "json

Plug 'tpope/vim-endwise'
Plug 'junegunn/vim-easy-align' "align text

"Plug 'ervandew/supertab'       " tab completion
Plug 'sickill/vim-pasta'       " enhances the default paste command ('p')

Plug 'myusuf3/numbers.vim' "line numbering done right
set number "will be relative number while in normal mode thanks to numbers.vim

Plug 'tpope/vim-surround'      " support handling surrounding quotes/brackets/etc
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'    " syntax checking

Plug 'easymotion/vim-easymotion' "easier moving around
"go

Plug 'majutsushi/tagbar'

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Make % match xml tags
Plug 'edsono/vim-matchit', { 'for': ['html', 'xml'] }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go',  { 'for' : 'go' }
Plug 'maralla/completor.vim'
let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"go keybings
set autowrite
let g:go_list_type = "quickfix" "prefer quicklist to locationlist
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_fmt_fail_silently = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

Plug 'scrooloose/nerdtree'
Plug 'taiansu/nerdtree-ag'

Plug 'tpope/vim-dispatch' "dispatch command async

"Git stuff
Plug 'tpope/vim-fugitive'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
Plug 'idanarye/vim-merginal' "git branch stuff
Plug 'int3/vim-extradite' "git log stuff
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'AndrewRadev/splitjoin.vim'


Plug 'mhinz/vim-startify'

" Return to last edit position when opening files, except git commit message
 autocmd BufReadPost *
   \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Ctrl-P
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|pip_download_cache|wheel_cache)$',
    \ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
    \ 'link': '',
    \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
" Wait to update results (This should fix the fact that backspace is so slow)
let g:ctrlp_lazy_update = 1
" Show as many results as our screen will allow
let g:ctrlp_match_window = 'max:1000'

  let g:ctrlp_abbrev = {
    \ 'gmode': 'i',
    \ 'abbrevs': [
      \ {
        \ 'pattern': '^shj',
        \ 'expanded': 'fanmgmt/static/js/workflow',
        \ 'mode': 'pfrz',
      \ },
      \ {
        \ 'pattern': '^shh',
        \ 'expanded': 'fanmgmt/templates/workflow/compliance_review/jst',
        \ 'mode': 'pfrz',
      \ }
      \ ]
    \ }

" If we have sift-tool
"
set directory^=$HOME/.vim/tmp//

"Plug 'bronson/vim-trailing-whitespace'

" Use ; for commands., do not have to hold shift to do commands
nnoremap ; :
nnoremap , :

" the biggest key on the keyboard as leader makes sense, bind lots of stuff to it
let mapleader=" "
let maplocalleader=" "

"delete buffer
nmap <silent> <Leader>c :bdelete<CR>
nmap <silent> <Leader>w :write<CR>

"go mappings
au FileType go nmap <leader>r <Plug>(go-run)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


autocmd FileType go setlocal expandtab
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tt <Plug>(go-test-func)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>a <Plug>(go-alternate-edit)
au FileType go nmap <Leader>as <Plug>(go-alternate-split)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

au FileType go nmap <Leader>do <Plug>(go-doc)
au FileType go nmap <Leader>dov <Plug>(go-doc-vertical)
au FileType go nmap <Leader>dob <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)
noremap <leader>qq :cclose<CR>
map <leader>q :cnext<CR>


"git/fugitives
" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Extradite!<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :MerginalToggle<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gu :Gpull<CR>
nnoremap <Leader>gf :Gfetch<CR>
" same bindings for merging diffs as in normal mode
xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>

"cd to the current file's directory
"nnoremap <Leader>. :cd %:p:h<CR>:pwd<CR>

nmap <silent> <Leader>ev :vsplit $HOME/.vimrc<CR>
nmap <silent> <Leader>sv :source $HOME/.vimrc<CR>

Plug 'sjl/gundo.vim'
Plug 'mjakl/vim-asciidoc'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"i like dark things and small tabstops
set ts=2
set background=dark
colo solarized
let g:airline_theme='jellybeans'

" ==================== UltiSnips ====================
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" tips
" CTRL-6, back to last buffer
"open or close the right or left drawer, files or tags
map <F2> :NERDTreeToggle<CR>
map <F3> :Tagbar<CR>
map <F5> :GundoToggle<CR>

" to focus tagbar or nerdtree easily
nmap <silent> <Leader>z :NERDTree<CR>
nmap <silent> <Leader>zz :TagbarOpen fj<CR>
nmap <Leader>f :Ack<space>

nnoremap <leader>q :%s/\s\+$//e<cr>:let @/=''<cr>

" navigate windws quicker
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"cycle buffers
nmap <leader>. :b#<cr>

nmap <C-[> <C-T>
"spellcheck and tw for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72
set shiftwidth=2
set expandtab

set list listchars=tab:»·,trail:·
set grepprg=rg\ --vimgrep

" hide everywhere
set wildignore+=*.o,.git,.svn,node_modules,vendor,bower_components,jsdocs,coverage
set nolist
