lua require('config')
"NOTE: General Settings
set linespace=10
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set hlsearch                " highlight search
set incsearch               " incremental search
" set tabstop=4               " number of columns occupied by a tab
" set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
" set expandtab               " converts tabs to white space
" set shiftwidth=4            " width for autoindents
" set autoindent              " indent a new line the same amount as the line just typed
set autoindent noexpandtab tabstop=4 shiftwidth=4 " fixes the issues with makefile tabs stuff
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse in all modes
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set clipboard+=unnamedplus      " sets the clipboard

"NOTE: General Keymaps
" move split panes to left/bottom/top/right
 nnoremap <C-h> <C-W>H
 nnoremap <C-j> <C-W>J
 nnoremap <C-k> <C-W>K
 nnoremap <C-l> <C-W>L

 " move between panes to left/bottom/top/right
 nnoremap <A-h> <C-w>h
 nnoremap <A-j> <C-w>j
 nnoremap <A-k> <C-w>k
 nnoremap <A-l> <C-w>l

" set the leader key
let mapleader = ","


 " set shortcut for seeing todos
map <Leader>t :TodoQuickFix<CR>

" when <leader>s is pressed update the file (like :w but only changes updated lines)
nnoremap <Leader>s :update<cr>

" clear search
nnoremap <Leader>c <Cmd> :noh<CR>

" set buffer navigation
nnoremap <Tab> :bnext<CR>
noremap <S-Tab> :bprev<CR>

" make it so backspace in normal mode and insert mode is delete
nmap <BS> hvd
vmap <BS> d
"Remove all trailing whitespace
nnoremap <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Increases the font size with `amount`
function! Zoom2(amount) abort
  call ZoomSet2(matchstr(&guifont, '\d\+$') + a:amount)
endfunc

" Sets the font size to `font_size`
function ZoomSet2(font_size) abort
  let &guifont = substitute(&guifont, '\d\+$', a:font_size, '')
endfunc

noremap <silent> <C-=> :call Zoom2(v:count1)<CR>
noremap <silent> <C--> :call Zoom2(-v:count1)<CR>
noremap <silent> <C-0> :call ZoomSet2(11)<CR>


"NOTE: Vim-Plug
call plug#begin()
 " Plugin Section

    " plugin for zooming and zooming out 
    " Plug 'https://github.com/vim-scripts/zoom.vim/tree/master'
    " themes
    Plug 'dracula/vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'https://github.com/sainnhe/everforest'
    Plug 'doums/darcula'

    " not sure ngl
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    "
    " vim airlines
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " fuzzyfinder
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " Telescope
    " a plugin that implements fzf in c so tellescope goes faster
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    " ripgrep, to help telescope with some searches
    " note, this was installed with pacman
    " plenary.nvim, a dependency of telescope
    Plug 'nvim-lua/plenary.nvim'
    " telescope itself
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }

    " fugitive for git
    Plug 'https://github.com/tpope/vim-fugitive'

    " plugins for comments
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'
    Plug 'https://github.com/tpope/vim-commentary'

    "vim devicons
    Plug 'ryanoasis/vim-devicons'



    "ale - an engine that runs installed linters if specified (im running
    "pylint wich is eneabled by default
    " Plug 'dense-analysis/ale'

    " debugging
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'folke/neodev.nvim'
    Plug 'https://github.com/neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"NOTE: Telescope
" Find files using Telescope command-line sugar.
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"NOTE: DAP Debugging
"set the open debug ui
map <F3> :lua require("dapui").toggle()<CR>
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <Leader>e <Cmd> lua vim.diagnostic.open_float()<CR>




"NOTE: Font and Airline
" devicons stuff
set encoding=UTF-8
set guifont=LiberationMono\ Nerd\ Font\ 12 " This is the default

" Airline stuff

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline_theme='bubblegum'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty='⚡'

" disable the arrows bc they don't match up in neovide bc of line spacing
if  exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    let g:airline_left_sep = ' '
    let g:airline_right_sep = ' '
endif

 "NOTE: Nerdtree
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
 " set the working directory to the current file
autocmd BufEnter * silent! lcd %:p:h

 " set NERDTreeToggle to F2
map <F2> :NERDTreeToggle<CR>

" opens files with one click
let g:NERDTreeMouseMode = 3

"NOTE: Themes
" color schemes
if (has("termguicolors"))
set termguicolors
endif
syntax enable
" theme
colorscheme darcula
" colorscheme evening
" colorscheme nord
" colorscheme everforest
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

"NOTE: CoC
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" note: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" note: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" note: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" note: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



"WARNING: Lua Block

lua << EOF
--NOTE: Telescope Lua

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
          }
        }
      },
    pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    },
    extensions = {
        fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

--NOTE: Todo-Comments Lua

-- the setup for todo comments
  require("todo-comments").setup {
}


-- to prevent getting the prompt Do you need to configure your work environment as luv? each time I open a file, didn't work
-- so i uncommented all the lua stuff
--require('lspconfig').lua_ls.setup {
--  settings = {
--    Lua = {
--      workspace = {
--        checkThirdParty = false,
--      },
--    },
--  },
--}

-- lua language server
--vim.lsp.start({
--  name = "lua-language-server",
--  cmd = { "lua-language-server" },
--  before_init = require("neodev.lsp").before_init,
--  root_dir = vim.fn.getcwd(),
--  settings = { Lua = {} },
--})

if vim.g.neovide == true then
    -- remove cursor animation
    vim.g.neovide_cursor_animation_length = 0
    -- keybindings for zooming in neovide
    vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

require("neodev").setup()
require'lspconfig'.pyright.setup{}
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require("dapui").setup()
require'lspconfig'.clangd.setup{}

EOF




