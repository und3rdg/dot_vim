" <INIT>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """""""" Same cfg for vim and nvim """""""""""""
    " put it to ~/.config/nvim/init.vim
    " set runtimepath^=~/.vim runtimepath+=~/.vim/after
    " let &packpath = &runtimepath
    " source ~/.vim/vimrc
    """"""""""""""""""""""""""""""""""""""""""""""""
    " and pick one of them
    let $vimrc = $HOME."/.vim/vimrc"
    " let $vimrc = $HOME."/.config/nvim/init.vim"
    " let $vimrc = $MYVIMRC

    let customConfig = $HOME."/.vim/custom.vimrc"
    let mapleader=","

    " VIMPLUG START
    call plug#begin('~/.vim/plugged')
    " DOWNLOAD VIM-PLUG IN CASE OF FRESH START
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source vimrc
    endif

    " STEP ABOVE 'NOCOMPATIBLE'
    Plug 'tpope/vim-sensible'

" <VIM-PLUG PLUGINS> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " GIT PLUGINS
        Plug 'tpope/vim-fugitive'
        " Plug 'shumphrey/fugitive-gitlab.vim' " Gbrowse gitlab
        " Plug 'tpope/vim-rhubarb' " Gbrowse github
        " git dif in gutter(column line number)
        Plug 'airblade/vim-gitgutter' 
            source ~/.vim/cfg_plug/vim-gitgutter.vim

    " FILE MANAGERS
        Plug 'scrooloose/nerdtree'
        Plug 'jistr/vim-nerdtree-tabs'
        Plug 'Xuyuanp/nerdtree-git-plugin'
            source ~/.vim/cfg_plug/nerdtree.vim
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
            source ~/.vim/cfg_plug/fzf.vim
        " quickfix window (cw) open in split/tab...
        Plug 'yssl/QFEnter'
        augroup myvimrc
            autocmd!
            autocmd QuickFixCmdPost [^l]* cwindow
            autocmd QuickFixCmdPost l*    lwindow
        augroup END
        " Plug 'rafaqz/ranger.vim'
        Plug 'francoiscabrol/ranger.vim'
            source ~/.vim/cfg_plug/ranger.vim

    " PRODUCTIVITY
        " Plug 'Shougo/neoyank.vim'
        Plug 'vim-scripts/YankRing.vim'
        Plug 'und3rdg/Tabmerge'

        Plug 'lilydjwg/colorizer' ", { 'on': 'Colorizer' }
            source ~/.vim/cfg_plug/colorizer.vim
        Plug 'blindFS/vim-colorpicker'
        "Plug 'davidhalter/jedi-vim' " python

        Plug 'tpope/vim-commentary'
        Plug 'tmhedberg/SimpylFold'
            source ~/.vim/cfg_plug/simplyfold.vim
        Plug 'godlygeek/tabular'
            vmap <leader>t :Tabularize/
        Plug 'dhruvasagar/vim-table-mode'
            source ~/.vim/cfg_plug/vim-table-mode.vim " <,tb>
        Plug 'AndrewRadev/linediff.vim'

        Plug 'christoomey/vim-tmux-navigator'
            source ~/.vim/cfg_plug/vim-tmux-navigator.vim
        Plug 'benmills/vimux'
            source ~/.vim/cfg_plug/vimux.vim
        Plug 'blueyed/vim-diminactive'

        Plug 'terryma/vim-expand-region'
            source ~/.vim/cfg_plug/vim-expand-region.vim
        Plug 'terryma/vim-smooth-scroll'
            source ~/.vim/cfg_plug/vim-smooth-scroll.vim
        Plug 'simeji/winresizer' " <C-e>
        Plug 'vimwiki/vimwiki'
        Plug 'djoshea/vim-autoread'
        Plug 'kshenoy/vim-signature'
            nnoremap mt :SignatureToggleSigns<cr>

    " SYNTAX
        Plug 'Valloric/YouCompleteMe'
            source ~/.vim/cfg_plug/youcompleteme.vim
        Plug 'mattn/emmet-vim'
            source ~/.vim/cfg_plug/emmet-vim.vim
        "definition's doc and renaming
        Plug 'ternjs/tern_for_vim'
        "linting
        Plug 'vim-syntastic/syntastic'
            source ~/.vim/cfg_plug/syntastic.vim

        " JAVACSRIPT
        " Plug 'pangloss/vim-javascript'
        Plug 'jelera/vim-javascript-syntax'
        Plug 'othree/javascript-libraries-syntax.vim'
        " Plug 'mxw/vim-jsx'
        Plug 'neoclide/vim-jsx-improve'

        " Plug 'ervandew/supertab'
        " AUTO ADD CLOSING
        Plug 'Raimondi/delimitMate'
            source ~/.vim/cfg_plug/delimate.vim
        Plug 'tmhedberg/matchit'
        " sass and cs3 syntax
        Plug 'cakebaker/scss-syntax.vim'
        Plug 'hail2u/vim-css3-syntax'
        " PARENTHESES IN DIFFERENT COLOR !!
        Plug 'luochen1990/rainbow'
            source ~/.vim/cfg_plug/rainbow.vim
        Plug 'nathanaelkane/vim-indent-guides'
            source ~/.vim/cfg_plug/vim-indent-guides.vim

    " THEME
        Plug 'morhetz/gruvbox'
            source ~/.vim/cfg_plug/gruvbox.vim
        " Plug 'altercation/vim-colors-solarized'

    call plug#end()

" <SETTINGS> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " filetype css if *.sass
    au BufRead,BufNewFile *.scss set filetype=scss.css
    " au BufRead,BufNewFile *.scss set filetype=css.scss
    au BufRead,BufNewFile *.sass set filetype=sass
    " au BufRead,BufNewFile *.sass set filetype=css.sass

    " jk, jj or kk  AS A ESC (as capslock in my systms is rmaped to esc, thre is no more need for this)
    imap jk <esc>

    " Auto save on focus lost
    au FocusLost * :wa

    " Stop that stupid window from popping up:
    map q: :q

    " Timeout for pressing key sequences
    set notimeout
    set ttimeout

    " Enable mouse, useful for window resizing
    " set mouse=a

    " Set history
    set history=900

    " Set <so> lines to the cursor and relative numbers
    set so=5

    " Set relativenumber
    " Automatic toggling between line number modes
    " Normal/Visual mode produce hybrid line numbers, 
    " Insert relative line numbers
    set number relativenumber

    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    " Areas of the screen where the splits should occur
    set splitbelow
    set splitright

    " Don't redraw while executing macros (good performance config)
    set lazyredraw 

    " For regular expressions turn magic on
    set magic

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    set encoding=utf8

    " Use Unix as the standard file type
    set ffs=unix,dos,mac

    " fugitive Gdiff vertically
    set diffopt+=vertical

    " auto change dir to dir of current file. Possible some plugins compatibility issue 
    " set autochdir


" <COLORS> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    syntax enable 
    try
    colorscheme gruvbox
    catch
    endtry

    set background=dark
    hi Normal ctermbg=0 guibg=#131313
    hi ColorColumn ctermbg=0 guibg=#303030
    hi LineNr ctermbg=0 guibg=#3C3836

    if has("patch-7.4.710")
        set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
    else
        set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
    endif

    " don't show white spaces
    set nolist

    " Set extra options when running in GUI mode
    if has("gui_running")
        set guioptions-=T
        set guioptions-=e
        set t_Co=256
        set guitablabel=%M\ %t
    endif

    " Fix background in tmux
    set t_ut=

" <TAB BAR> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! Tabline()
        let s = ''
        for i in range(tabpagenr('$'))
            let tab = i + 1
            let winnr = tabpagewinnr(tab)
            let buflist = tabpagebuflist(tab)
            let bufnr = buflist[winnr - 1]
            let bufname = bufname(bufnr)
            let bufmodified = getbufvar(bufnr, "&mod")

            let s .= '%' . tab . 'T'
            let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
            let s .= ' ' . tab .'°'
            let s .= (bufname != '' ? fnamemodify(bufname, ':t')  : '[No Name]')

            if bufmodified
                let s .= '[+]'
            endif
            let s .= ' '
        endfor

        let s .= '%#TabLineFill#'
        if (exists("g:tablineclosebutton"))
            let s .= '%=%999XX'
        endif
        return s
    endfunction
    set tabline=%!Tabline()

    hi! TabLineFill cterm=none gui=none ctermfg=59 ctermbg=100 guifg=#5F5F5F guibg=#3A3A3A 
    hi! TabLine     cterm=none gui=none ctermfg=59 ctermbg=100 guifg=#5F5F5F guibg=#A8A8A8
    hi! TabLineSel  cterm=none gui=none ctermfg=59 ctermbg=214 guifg=#5F5F5F guibg=#FFAF00 

" <STATUSLINE>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    function! GitBranch()
        return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    endfunction
    function! GitFileStatus()
        return system("[[ -n \"$(git status --porcelain " . shellescape(expand("%")) . " 2>/dev/null )\" ]] && echo -n ✰ ")
    endfunction

    function! StatuslineGit()
        let l:branchname = GitBranch()
        let l:status = GitFileStatus()
        return strlen(l:branchname) > 0?'['.l:branchname.l:status.']':''
    endfunction

    hi User1 guibg=#FFAF00 guifg=#222222
    hi User2 guibg=#504945  guifg=#191919
    hi User3 guibg= #A8A8A8 guifg=#222222

    set statusline=
    " Name of the current function (needs taglist.vim)
    " set statusline +=\ [Fun(%{Tlist_Get_Tagname_By_Line()})]
    " set statusline +=\ [Fun(%{tagbar#currenttag('%s','')})]
    set statusline+=\ %#warningmsg#
    set statusline+=\ %{SyntasticStatuslineFlag()}
    set statusline+=\ %2*%y
    set statusline+=\ %p%%  
    set statusline+=\[%L]
    set statusline+=\ %l:%c
    set statusline+=\ %=
    set statusline+=\ %1*\ %.35{getcwd()}\ %2*
    set statusline+=\ %3*\ %{StatuslineGit()}\ %2*
    set statusline+=\ %1*\ %f%m  
    set statusline+=\ %*
    set statusline+=\ 

" <FILES, BACKUPS AND UNDO> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Turn backup off, since most stuff is in SVN, git et.c anyway...
    set nobackup
    set nowb
    set noswapfile

    " Set to auto read when a file is changed from the outside
    set autoread

" <TEXT, TAB AND INDENT RELATED> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs ;)
    set smarttab

    " 1 tab == 2 spaces
    set shiftwidth=4
    set tabstop=4
    set expandtab

    " Line break on 500 characters
    set lbr
    set tw=500

    set ai "Auto indent
    set si "Smart indent
    set wrap "Wrap lines

" <VISUAL MODE> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " highlight in visual stay
    vnoremap > >gv
    vnoremap < <gv

    " This way v replaces viw, vaw, vi", va", vi(, va(, vi[, va[, vi{, va{, vip, vap, vit, vat, ... You get the idea.
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)

" <MOVING AROUND, TABS, WINDOWS AND BUFFERS> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk

    "split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " fullscreen window ',z'
    nnoremap <leader>z :tabnew %<CR>

" <FOLDING> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable folding
    " set foldmethod=manual
    set foldmethod=indent
    " set foldmethod=expr 
    " expresion to fold paragrafs with two empty lines
    set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'^\\s*$'&&getline(v:lnum+2)=~'\\S'?'<1':1
    " modeline version (escape colon's)
    " // vim: foldmethod=expr foldexpr=getline(v\:lnum)=~'^\\s*$'&&getline(v\:lnum+1)=~'^\\s*$'&&getline(v\:lnum+2)=~'\\S'?'<1'\:1
    " set foldmethod=marker 
    " set foldmethod=syntax 
    " set foldmethod=diff 

    " set foldmarker=,}}}
    set foldlevel=9

    " Enable folding with the spacebar
    nnoremap <Leader>f za

    " Add a bit extra margin to the left
    set foldcolumn=5

" <SEARCH> 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ignore case when searching
    set ignorecase
    " When searching try to be smart about cases 
    set smartcase
    " Highlight search results
    set hlsearch
    " Makes search act like search in modern browsers
    set incsearch 
    " Show matching brackets when text indicator is over them
    set showmatch 
    " How many tenths of a second to blink when matching brackets
    set mat=4

    " Disable highlight till next search ',/'
    map <silent> <leader>/ :noh<cr>

    " useful when studying strange source code.
        source ~/.vim/func/AutoHighlightToggle.vim
    nnoremap <leader>hh :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

    " search visual selected '//'
    vnoremap // y/<C-R>"<CR>

    " selecting/searching yanked text 'gp'
    map gp `[v`]
    map g/ /<C-r>"

    " Highlight yanked
        nnoremap <silent> <? :let @/=substitute(escape(@", '\\/.*$^~[]'), '\n', '\\n', 'g')<CR>:set hlsearch<cr> 

    " Search selected
    " todo: I like to make it behave like 'Highlight yanked' above
    vnoremap <silent> * :<C-U>
                \let old_reg=getreg('"')<bar>
                \let old_regmode=getregtype('"')<cr>
                \gvy/<C-R><C-R>=substitute(
                \escape(@", '\\/.*$^~[]'), '\n', '\\n', 'g')<cr><cr>
                \:call setreg('"', old_reg, old_regmode)<cr>
                \<S-n>

" <PRODUCTIVITY, KEY BINDINGS > 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Type ',,' to save file (a lot faster than ':w<Enter>'):
    nnoremap <Leader>, :w<CR>

    " save ',s' and open session with 'vim -S'
    nnoremap <leader>s :mksession!<CR>

    " Type ',q' to quit file
    nnoremap <Leader>q :q<CR>

    " Copy & paste to system clipboard with ',p' and ',y':
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P

    " Open vimrc with ',ev'
    nnoremap <leader>ev :tabnew $vimrc<CR>
    nnoremap <leader>ec :source %<CR>:echom 'SOURCE current file'<CR>
    nnoremap <leader>es :source $vimrc <CR>:echom 'SOURCE vimrc'<CR>
    " auto reload vimrc
    " bug: it reloadnig only in vimrc, not in source's
    augroup reload_vimrc 
        autocmd!
        autocmd BufWritePost $vimrc source $vimrc | echom "SOURCE ".$vimrc
    augroup END 

    " cd to current file dir, only current window
    nnoremap <silent> <leader>cd :lcd %:p:h<CR>

    " toggle spell check locally
    nnoremap <F7> :setlocal spell! spell?<CR>
    imap <F7> <c-o>:setlocal spell! spell?<CR>

    " remove html tag, keep content
    map <leader>dt "aditcat<C-x><C-r>a<ESC>

" <CUSTOM VIMRC>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Override global cfg in '~/.vim/custom.vimrc'
    " This file is in .gitignore.
    " It is for local machine specific adjustments.
    if !empty(glob(customConfig))
        exe 'source' . customConfig
    else
        echom "Creating " . customConfig 
        " call !mkdir customConfig
        silent exe '!touch '.customConfig
    endif

