let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-G>Þ <Nop>
inoremap <silent> <C-G> <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
inoremap <C-G>S <Plug>(nvim-surround-insert-line)
inoremap <C-G>s <Plug>(nvim-surround-insert)
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <C-W> u
inoremap <C-U> u
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
nnoremap <silent> Þ <Nop>
nnoremap <silent>  <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
nnoremap <silent>  Þ <Nop>
nnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
nnoremap    <Cmd>Neotree focus
nnoremap     <Cmd>Neotree toggle
nnoremap  tp <Cmd>TSPlaygroundToggle
nnoremap <silent>  lÞ <Nop>
nnoremap <silent>   Þ <Nop>
nnoremap <silent>  tÞ <Nop>
nnoremap <silent>  cÞ <Nop>
nnoremap <silent>  fÞ <Nop>
xnoremap <silent>  Þ <Nop>
xnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "v", auto = true})
nnoremap  # <Cmd>CccPick
nnoremap  tc <Cmd>CccHighlighterToggle
nnoremap  k <Cmd>lua vim.diagnostic.open_float()
nnoremap  ts <Cmd>setl spell!
nnoremap  tl <Cmd>setl list!
nnoremap  cp <Cmd>cprevious
nnoremap  cn <Cmd>cnext
nnoremap  ck <Cmd>cabove
nnoremap  cj <Cmd>cbelow
nnoremap  c <Cmd>copen
xnoremap  p "_dP
vnoremap  y "+y
nnoremap  y "+y
nnoremap <silent> !aÞ <Nop>
nnoremap <silent> !iÞ <Nop>
nnoremap <silent> !Þ <Nop>
nnoremap <silent> ! <Cmd>lua require("which-key").show("!", {mode = "n", auto = true})
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
xnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "v", auto = true})
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
xnoremap * y/\V"
nnoremap <silent> <aÞ <Nop>
nnoremap <silent> <iÞ <Nop>
nnoremap <silent> <Þ <Nop>
nnoremap <silent> < <Cmd>lua require("which-key").show("<", {mode = "n", auto = true})
nnoremap <silent> >Þ <Nop>
nnoremap <silent> > <Cmd>lua require("which-key").show(">", {mode = "n", auto = true})
nnoremap <silent> >aÞ <Nop>
nnoremap <silent> >iÞ <Nop>
nnoremap <silent> S <Plug>(leap-backward)
xnoremap S <Plug>(nvim-surround-visual)
onoremap <silent> X <Plug>(leap-backward-x)
nnoremap Y y$
onoremap <silent> Z <Plug>(leap-backward)
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()
nnoremap [b <Cmd>UmaDlc buf prev
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()
nnoremap ]b <Cmd>UmaDlc buf next
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xmap a% <Plug>(MatchitVisualTextObject)
nnoremap <silent> cÞ <Nop>
nnoremap <silent> c <Cmd>lua require("which-key").show("c", {mode = "n", auto = true})
nnoremap cS <Plug>(nvim-surround-change-line)
nnoremap cs <Plug>(nvim-surround-change)
nnoremap <silent> caÞ <Nop>
nnoremap <silent> ciÞ <Nop>
nnoremap <silent> dÞ <Nop>
nnoremap <silent> d <Cmd>lua require("which-key").show("d", {mode = "n", auto = true})
nnoremap ds <Plug>(nvim-surround-delete)
nnoremap <silent> daÞ <Nop>
nnoremap <silent> diÞ <Nop>
nnoremap <silent> g' <Cmd>lua require("which-key").show("g'", {mode = "n", auto = true})
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
onoremap <silent> gs <Plug>(leap-cross-window)
nnoremap <silent> gs <Plug>(leap-cross-window)
xnoremap gS <Plug>(nvim-surround-visual-line)
onoremap <silent> gc <Cmd>lua MiniComment.textobject()
xnoremap <silent> gc :lua MiniComment.operator('visual')
nnoremap <silent> guaÞ <Nop>
nnoremap <silent> guiÞ <Nop>
nnoremap <silent> guÞ <Nop>
nnoremap <silent> gUaÞ <Nop>
nnoremap <silent> gUiÞ <Nop>
nnoremap <silent> gUÞ <Nop>
nnoremap <silent> g~aÞ <Nop>
nnoremap <silent> g~iÞ <Nop>
nnoremap <silent> g~Þ <Nop>
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap gB <Cmd>UmaDlc buf del
nnoremap gb <Cmd>UmaDlc buf goto
xnoremap <silent> s <Plug>(leap-forward)
nnoremap <silent> s <Plug>(leap-forward)
nnoremap <silent> vÞ <Nop>
nnoremap <silent> v <Cmd>lua require("which-key").show("v", {mode = "n", auto = true})
nnoremap <silent> vaÞ <Nop>
nnoremap <silent> viÞ <Nop>
onoremap <silent> x <Plug>(leap-forward-x)
nnoremap <silent> yÞ <Nop>
nnoremap <silent> y <Cmd>lua require("which-key").show("y", {mode = "n", auto = true})
nnoremap ySS <Plug>(nvim-surround-normal-cur-line)
nnoremap yS <Plug>(nvim-surround-normal-line)
nnoremap yss <Plug>(nvim-surround-normal-cur)
nnoremap ys <Plug>(nvim-surround-normal)
nnoremap <silent> yaÞ <Nop>
nnoremap <silent> yiÞ <Nop>
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
onoremap <silent> z <Plug>(leap-forward)
nnoremap <silent> zfaÞ <Nop>
nnoremap <silent> zfiÞ <Nop>
nnoremap <silent> zfÞ <Nop>
nnoremap <silent> <C-W>Þ <Nop>
nnoremap <silent> <C-W> <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
xnoremap <silent> <Plug>(nvim-surround-visual-line) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = true })
xnoremap <silent> <Plug>(nvim-surround-visual) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = false })
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap <silent> Þ <Nop>
inoremap <silent>  <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
inoremap S <Plug>(nvim-surround-insert-line)
inoremap s <Plug>(nvim-surround-insert)
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set clipboard=unnamed
set cmdheight=0
set copyindent
set expandtab
set fillchars=fold:\ ,horiz:\ ,horizdown:\ ,horizup:\ ,vert:\ ,verthoriz:\ ,vertleft:\ ,vertright:\ 
set foldlevelstart=99
set guicursor=a:NoiceHiddenCursor
set helplang=en
set ignorecase
set laststatus=3
set listchars=conceal:%,eol:$,extends:>,nbsp:+,precedes:<,space:.,tab:>\ ,trail:~
set noloadplugins
set mouse=ar
set operatorfunc=v:lua.require'nvim-surround'.change_callback
set packpath=/usr/share/nvim/runtime
set preserveindent
set runtimepath=~/.config/nvim,~/.local/share/nvim/lazy/lazy.nvim,~/.local/share/nvim/lazy/nvim-window-picker,~/.local/share/nvim/lazy/neo-tree.nvim,~/.local/share/nvim/lazy/fidget.nvim,~/.local/share/nvim/lazy/cmp-path,~/.local/share/nvim/lazy/leap.nvim,~/.local/share/nvim/lazy/cmp-buffer,~/.local/share/nvim/lazy/cmp_luasnip,~/.local/share/nvim/lazy/nvim-surround,~/.local/share/nvim/lazy/cmp-nvim-lsp,~/.local/share/nvim/lazy/mason.nvim,~/.local/share/nvim/lazy/mason-lspconfig.nvim,~/.local/share/nvim/lazy/nvim-lspconfig,~/.local/share/nvim/lazy/playground,~/.local/share/nvim/lazy/mini.comment,~/.local/share/nvim/lazy/nvim-ts-context-commentstring,~/.local/share/nvim/lazy/nvim-treesitter-textobjects,~/.local/share/nvim/lazy/gitsigns.nvim,~/.local/share/nvim/lazy/nvim-treesitter,~/.local/share/nvim/lazy/friendly-snippets,~/.local/share/nvim/lazy/LuaSnip,~/.local/share/nvim/lazy/nvim-cmp,~/.local/share/nvim/lazy/nvim-autopairs,~/.local/share/nvim/lazy/telescope-fzf-native.nvim,~/.local/share/nvim/lazy/plenary.nvim,~/.local/share/nvim/lazy/telescope.nvim,~/.local/share/nvim/lazy/nui.nvim,~/.local/share/nvim/lazy/nvim-notify,~/.local/share/nvim/lazy/noice.nvim,~/.local/share/nvim/lazy/which-key.nvim,~/.local/share/nvim/lazy/ccc.nvim,~/.local/share/nvim/lazy/sopa.nvim,~/.local/share/nvim/lazy/heirline.nvim,~/.local/share/nvim/lazy/nvim-web-devicons,~/.local/share/nvim/lazy/alpha,/usr/share/nvim/runtime,/usr/share/nvim/runtime/pack/dist/opt/matchit,~/.local/state/nvim/lazy/readme,~/.local/share/nvim/lazy/cmp-path/after,~/.local/share/nvim/lazy/cmp-buffer/after,~/.local/share/nvim/lazy/cmp_luasnip/after,~/.local/share/nvim/lazy/cmp-nvim-lsp/after,~/.local/share/nvim/lazy/playground/after
set shiftround
set shiftwidth=0
set showcmdloc=statusline
set showmatch
set showtabline=2
set smartcase
set smartindent
set spelllang=en_us
set statusline=%{%v:lua.require'heirline'.eval_statusline()%}
set tabline=%{%v:lua.require'heirline'.eval_tabline()%}
set tabstop=2
set tagcase=followscs
set termguicolors
set textwidth=79
set timeoutlen=500
set title
set ttimeoutlen=0
set undofile
set updatetime=250
set virtualedit=all
set visualbell
set window=54
" vim: set ft=vim :
