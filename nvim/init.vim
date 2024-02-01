syntax on
set number
set relativenumber
set mouse=a  " enable mouse
set encoding=utf-8 " кодировка
set noswapfile " указание на то, чтобы не генерить swapfile
set scrolloff=7
set smarttab
set tabstop=4 " 1 tab = 4 space
set autoindent " копирование текущих отступов при переходе на новую строку
set fileformat=unix
filetype indent on      " load filetype-specific indent files

inoremap jk <esc>

call plug#begin()

" Коментарии
Plug 'https://github.com/tpope/vim-commentary'

" Тема для NVIM
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" файловый мененджер.
Plug 'preservim/nerdtree'

" плагин для отображения статуса работы
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'tamton-aquib/staline.nvim'
"Plug 'https://github.com/adelarsq/neoline.vim'

" поддержка языков
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" IntelliSense:
Plug 'neovim/nvim-lspconfig'

call plug#end()

" NERDTree config
autocmd VimEnter * NERDTree " start in nerdtree panel
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" colorscheme onehalfdark
let g:airline_theme='onehalfdark'

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
