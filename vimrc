set nonu
syntax on
" fix mac vim delete error, so as set backspace=indent,eol,start
set backspace=2
set nocompatible              " be iMproved, required
" 自动对齐
set autoindent
" 智能自动对齐
set smartindent
" 缩进
set tabstop=2
set shiftwidth=2
"highlight PMenu ctermfg=95 ctermbg=215 guifg=black guibg=blue
"highlight PMenuSel ctermfg=215 ctermbg=95 guifg=blue guibg=black
filetype off                  " required
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
"highligh search enabled by default
set hlsearch
"set mouse=a     "Enables mouse click
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'https://github.com/vim-scripts/a.vim.git'
"Plug 'Valloric/YouCompleteMe'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-fugitive'
"Plug 'taglist.vim'
Plug 'brookhong/cscope.vim'
Plug 'preservim/tagbar'
"Plug 'ctags.vim'
Plug 'scrooloose/nerdtree'
Plug 'bfrg/vim-cpp-modern'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lyuts/vim-rtags'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/ZoomWin'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'

" Track the engine.
Plug 'SirVer/ultisnips'
"Plug 'vim-syntastic/syntastic'
Plug 'python-mode/python-mode'
"let g:pymode_python = 'python3'
"key mapping for python-mode
let g:pymode_rope_organize_imports_bind = '<leader>mo'
Plug 'ericcurtin/CurtineIncSw.vim'
map <C-h> :call CurtineIncSw()<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'cjrh/vim-conda'
"Plug 'davidhalter/jedi-vim'
" plugin for google format
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'rhysd/git-messenger.vim'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  "autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType python AutoFormatBuffer autopep8
  "autocmd FileType python AutoFormatBuffer pylint
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
Plug 'google/styleguide'
let g:fzf_install = 'yes | ./install'
Plug 'junegunn/fzf',{ 'do': g:fzf_install } 
Plug 'junegunn/fzf.vim'
" ...
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:ycm_auto_hover=""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
nmap <leader>d <plug>(YCMHover)

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'ascenator/L9', {'name': 'newL9'}
" 
"Plug 'derekwyatt/vim-scala'
Plug 'ianding1/leetcode.vim'
let g:leetcode_username = "tengfeimoon@gmail.com"
" All of your Plugs must be added before the following line
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/echodoc.vim'
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plug stuff after this line
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_path_to_python_interpreter="/Users/tiantengfei/anaconda3/envs/tensorflow/bin/python"
let g:ycm_error_symbol = '!'
let g:ycm_warning_symbol = '?'
let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:leetcode_browser = 'chrome'
let g:leetcode_china = 1
set tabstop=4 softtabstop=4
" 按F8按钮，在窗口的左侧出现taglist的窗口,像vc的左侧的workpace
nnoremap <silent> <F8> :TlistToggle<CR><CR>
" :Tlist              调用TagList
let Tlist_Show_One_File=0                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <C-n> :NERDTreeToggle<CR>
" leetcode.vim
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
call plug#end()            " required
call glaive#Install()
