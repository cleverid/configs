local map = vim.api.nvim_set_keymap
local set = vim.keymap.set
local default_opts = {noremap = true, silent = true}

vim.g.mapleader = " "  -- Sets the spacebar as the leader key
vim.g.maplocalleader = " " -- You can also set a local leader if needed


-----------------------------------------------------------
-- НАВИГАЦИЯ
-----------------------------------------------------------
-- Отключаем стрелочки в Нормальном Режиме. Хардкор!
map('', '<up>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
-- <F5> разные вариации нумераций строк, можно переключаться на ходу
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
-----------------------------------------------------------
-- РЕЖИМЫ
-----------------------------------------------------------
-- Выходим в нормальный режим через <jk>, чтобы не тянуться
map('i', 'jj', '<Esc>', {noremap = true})
-----------------------------------------------------------
-- ПОИСК
-----------------------------------------------------------
-- Выключить подсветку поиска через комбинацию ,+<space>
map('n', ',<space>', ':nohlsearch<CR>', {noremap = true})
-- Fuzzy Search. CTRL+a для поиска по файлам, CTRL+p для поиска по буфферам
map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)
-- <S-F5> Греповский поиск слова под курсором
map('n', '<S-F5>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Греповский поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-----------------------------------------------------------
-- ФАЙЛЫ
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- <F4> Дерево файлов. Для иконок следует установить Nerd Font
map('n', '<F4>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)

-----------------------------------------------------------
-- Smart splits
-----------------------------------------------------------
set('n', '<A-h>', require('smart-splits').resize_left)
set('n', '<A-j>', require('smart-splits').resize_down)
set('n', '<A-k>', require('smart-splits').resize_up)
set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
set('n', '<C-h>', require('smart-splits').move_cursor_left)
set('n', '<C-j>', require('smart-splits').move_cursor_down)
set('n', '<C-k>', require('smart-splits').move_cursor_up)
set('n', '<C-l>', require('smart-splits').move_cursor_right)
set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
-- swapping buffers between windows
set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
