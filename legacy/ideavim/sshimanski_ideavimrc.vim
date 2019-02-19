set laststatus=2
set hlsearch
set ignorecase
set incsearch
set showcmd
set showmode
set smartcase
" Enable vim-surround
set surround

let mapleader=","
nnoremap ' `
nnoremap ` '

nnoremap <Space> <nop>
nnoremap <leader>ev :e ~/.ideavimrc<CR>
nnoremap <leader>sv :source ~/.ideavimrc<CR>

map <leader>y "+y
map <leader>p "*p
map <leader>P a<space><esc>p

noremap Y y$
nnoremap n nzz
nnoremap N Nzz
" nnoremap gd gdzz
nnoremap vv ggVG
nnoremap U :action Vcs.RollbackChangedLines<CR>

nmap z+ :action EditorIncreaseFontSize<CR>
nmap z- :action EditorDecreaseFontSize<CR>

vnoremap < <gv
vnoremap > >gv

" unimpaired legacy
noremap ]m :action MethodDown<CR>
noremap [m :action MethodUp<CR>
noremap ]l :action GotoNextError<CR>:action ShowErrorDescription<CR>
noremap [l :action GotoPreviousError<CR>:action ShowErrorDescription<CR>

"No tabs => no tabs navigation
"noremap [b gT
"noremap ]b gt

" camelcase words: ] - forward, [ - backward
noremap [w [b
noremap ]w [w
noremap [c :action VcsShowPrevChangeMarker<CR>:action Vcs.ShowDiffWithLocal<CR>
noremap ]c :action VcsShowNextChangeMarker<CR>:action Vcs.ShowDiffWithLocal<CR>
nnoremap [<Space> O<ESC>j 0 w
nnoremap ]<Space> o<ESC>k 0 w

nnoremap coh :nohlsearch<CR>
nnoremap cob :action ToggleLineBreakpoint<CR>

xnoremap <C-S-o> :action OverrideMethods<CR>
xnoremap <C-S-i> :action ImplementMethods<CR>
" Identifier Highlighter Reloaded plugin mapping
noremap <C-S-j> :action NextIdentifierReloaded<CR>
noremap <C-S-k> :action PreviousIdentifierReloaded<CR>

nmap gcc :action CommentByLineComment<CR>
vnoremap gc :<bs><bs><bs><bs><bs>action VimVisualSwapSelections<CR>:action CommentByLineComment<CR>
vnoremap gC :<bs><bs><bs><bs><bs>action VimVisualSwapSelections<CR>:action CommentByBlockComment<CR>

" denite.vim (lists)
noremap <Space>b :action Switcher<CR>
noremap <Space>r :action RecentFiles<CR>
noremap <Space>d :action RecentChangedFiles<CR>
noremap <Space>c :action GotoClass<CR>
noremap <Space>f :action GotoFile<CR>
noremap <Space>g :action FindInPath<CR>
" noremap <Space>s :action GotoSymbol<CR>
noremap <Space>lp :action ManageRecentProjects<CR>

" denite outline
nnoremap <Space>m :action FileStructurePopup<CR>
noremap <Space>u :action FindUsages<CR>
noremap <Space>w :action SelectIn<CR>

nmap gM :action ShowBookmarks<CR>
nmap gn :action GotoNextBookmark<CR>
nmap gp :action GotoPreviousBookmark<CR>

" maximize working area
noremap <C--> :action HideAllWindows<CR>

" Mnemonic: 'to'
nnoremap td :action GotoTypeDeclaration<CR>zt
nnoremap ti :action GotoImplementation<CR>zt
nnoremap ts :action GotoSuperMethod<CR>zt
nnoremap tt :action GotoTest<CR>zt
nnoremap tu :action ShowUsages<CR>
" to 'class'
nnoremap tc gg<BAR>:action MethodDown<CR>zt

" native back/forward is less buggy, <C-t> still useful
noremap <C-o> :action Back<CR>
noremap <C-i> :action Forward<CR>

" Mnemonic 'extract'
nnoremap <leader>em :action ExtractMethod<CR>
vnoremap <leader>em :<BS><BS><BS><BS><BS>action VimVisualSwapSelections<CR>:action ExtractMethod<CR>
noremap <leader>ec :action ExtractClass<CR>

noremap <leader>N :action NewElement<CR>

" Mnemonic 'introduce'
noremap <leader>ic :action IntroduceConstant<CR>
noremap <leader>if :action IntroduceField<CR>
noremap <leader>ip :action IntroduceParameter<CR>
" use postfix .var for variable
noremap <leader>iv :action IntroduceVariable<CR>

" Git
noremap <leader>gb :action Annotate<CR>
noremap <leader>gl :action Vcs.Show.Log<CR>
noremap <leader>gg :action Vcs.QuickListPopupAction<CR>

" EasyMotion (AceJump plugin)
nmap <leader><leader> :action AceAction<CR>

nmap RR :action Refactorings.QuickListPopupAction<CR>

" Common
noremap <leader>c :action CheckinProject<CR>
noremap <leader>u :action Vcs.UpdateProject<CR>
noremap <leader>h :action TypeHierarchy<CR>
" noremap <leader>h :action HighlightUsagesInFile<CR>
noremap <leader>I :action Inline<CR>
noremap <leader>k :q<CR>
noremap <leader>m :action Move<CR>
noremap <leader>r :action RenameElement<CR>
noremap <leader>f :action ReformatCode<CR>:action OptimizeImports<CR>:action AutoIndentLines<CR>
noremap <leader>G :action Generate<CR>
vnoremap <leader>s :<BS><BS><BS><BS><BS>action VimVisualSwapSelections<CR>:action SurroundWithLiveTemplate<CR>

noremap \t :action ChooseDebugConfiguration<CR>
noremap \d :action ChooseDebugConfiguration<CR>
noremap \r :action ChooseRunConfiguration<CR>
