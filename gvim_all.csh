
#### 
linux vim   windows gvim  mac macvim 
vi is not vim ;   eclipse/vs  emacs/sublime/textmate 
# windows shortcut  popup  menus
copy gvimext32/gvimext.dll into windows/system/ & windows/system32/; 
copy libintl-8.dll into windows/system;
regedit: HKEY_LOCAL_MACHINE/software/vim/gvim,  is used by gvimext.dll; 
       value "path" specified location of "gvim.ext"; value "lang" set languages, e.g "de";
github.com/vim/vim-win32-installer/releases


#### Yan Pritzker, learn to peak vim -verbs, nouns and modifiers
:help text-objects
http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
https://github.com/brookhong/vimfiles

# verbs d: delete, r:replace, y:yank, v:visual(select);
# nouns w: word,   s:setence, p:paragraph, b: block(parenthesis,braces);
# prons i: inside, a:around,  t:till(not include), f:find(include);
cis: change inside setence
vis: visual inside setence
diw: delete inside word  
dis: delete inside setence  
dit: delete inside tag(html/xml);
dte: delete till e       

gUis/gUip: change upper case inside sentence/paragraph;
guis/guip: change lower case inside sentence/paragraph;
guiw/gUiw: change lower/upper case inside word;


### gvim setting & session & view;
:mk                       # save settings into _exrc;
:sh                       # open command line; exit to return into gvim ;
:mks session1.vim;        # save current session;
csh> vim -S session1.vim; # reload session;
vim> source session1.vim; # reload session;
vim> :mkview v1.vim ;     # save view;
vim> source v1.vim;       # load view;
vim> :loadview v1.vim;    # load view;

#### ctags
csh> ctags -R 1.txt *.txt;  gvim 1.txt;
gvim> ctrl-]; ctrl-T; ctrl-6; <mouse_double_click>; g<mouse_right>;

## setup, syntax, highlight search; 
:syn on/off; # syntax on/off
:syntax  on; # syntax on/off
:set syntax=csh  ; # gvim .aliases, manually set syntax as csh;
:set syntax=verilog
:set hls;  # hl search on;
:set hls!; # hl search off;
:help vimrc;

## doc/change.txt
5x; 5X; 
5d[motion:<- ->]; D(=d$); d^; dd; 5dd; dh;
[ctrl-v]d; # delete highlighted text;
[ctrl-v]x; # delete highlighted text;
5s; 5a
~; 5~;  # toggle CASE; 
g~~;    # toggle CASE of current line;
[ctrl-v]~; # toggle CASE of highlighted text;
guu; gUU; # lowercase/uppercase of current line;
5J;  

8888a  fafasdf a888 ;
787 111 222 333 787 787 
787 111 222 333 787 787 
787 111 222 333 787 787 
787 
787 
787 

### sort 
:sort 
# sorting lines in editors
:.,+3!sort
# row sort
:sort n;  

### enumerate defines/params in header.h, replace into numbers in tdatq.v;  
:%s/`NUM_GRP`/86/g  ; # replace current search patterns(e.g, `NUM_GRP) into 86;
:,$s//86/g ;          # replace pattern, from current line to last line;
gvim mapping.vim_mid_def.txt;
# in header file "`define WIDTH = 16", search/replace ":%s#define #150,$s/#g", ":%s# #/#g", ":%s#$#/g#g" ; 
# write into mapping.vim.txt: ":150,$ s/`WIDTH/16/g";
# in params file "parameter DEPTH=43", write tino mapping.txt; gvim ":150,$ s/DEPTH/43/g",   
gvim tdatq.v;
gvim> :source mapping.vim.txt;
# gvim not pause for every 25 lines, :set nomore (:set more )
gvim> set nomore; # set more;

### vertical select and increment/decrement numbers;
ctrl-v  select vertically; 
ctrl-a:  1/1/1/1 to 2/2/2/2;   
g ctrl-a: increment 1/1/1/1 to 2/3/4/5;  
g ctrl-x: decrement 2/2/2/2 to 1/0/-1/-2;
1
1
1
1



### auto_function_name    
ctrl-N: 
### delete next 20 lines;
d20G;

###  record, replay
qa<...>q
@a;
6@a;

#### editing files
gf; # edit files under cursor;
:ls  :buffers  :files    # file list in current buffer
:e :edit  # edit current file
:e #1     # edit 1th file in buffers
:e #8     # edit 8th file in buffers
### insert/append/newline/cut/substitute
iIaAoOxs

###
delete/yank
dd yy p
ggVG u|U  select text change into lowercase/uppercase
d/Data # delete until Data;
y2fE   # yank before 2nd E in line;

f / * g* n N
0 ^ B b h <> l e w E W $
gg Ctrl-b Ctrl-u k j Ctrl-d Ctrl-f G

### visual_select
ctrl-v  vap vi( 

# search pattern, then delete matched lines;
:g/<pattern>/d
# search pattern, then delete unmatched lines;
:v/<pattern>/d
# remove/delete unmatched words;
:g!/<string_to_keep>/d

:split
:vsplit

:set nu;  :set nonu;  :set number;  :set nonumber;

### search 
:/`\U.*\d ; # search "`MID_DEF_*=18"; "
\cwarning ; # ignorecase search; WARNING, warning, Warning ...

\d # digital number    
\a; [a-zA-Z]*;                # alphabet letter 
\w; [a-zA-Z0-9_]* ; [\a\d_]*; # word of any alphanumeric character or underscore
\W; [^a-zA-Z0-9_];            # non-word character 
\h; [\a_]*;                   # head of word character (a,b,c...z,A,B,C...Z,_) 
\D \W \A \H ; # non-digit|word|alphabet|head
/\(X|Y\)


/\d\{2}            # 2+ digits  # :g /\d\{3}//d; /d\{2}        
/\d\@<!\d\{2}\d\@! # 2 and 2 only digits; see also :help /\@!  :help /\@<!
/\v^(2021)@!       # all lines with no 2021 begin  
\v                 # use magic search,see also :h \v;  
^                  # matches start of line; 
(2021)@!           # @! is negative look ahead, after start of line; pattern shouldn't be 2021, parentheses here means a regex group.
:g!/^2021/-j       #  ^2021 is your pattern;  -j first sets the address to the line above and then joins it with the following one.
:g/^\_$\n\_^$/d   # merge 2+ blank lines into 1 line; dont touch 1 blank line; merge 2+ empty lines into 1 empty line;
:% s/^\s*$\n//g   # remove empty lines;
:%s/.*/& &/       # duplicate every line;
/feint\|supra  /feint\&.*supra # logic or/and
10,20g/^/mo 10    # revert lines between line 10 and line 20
g/^/m 0           # revert all lines;


### search & replace
# sub search range pattern replace regexp current digits

:% s/\v(\a{1,2})\w*_\w*(\w)\//\1_\2\//g
:% s/\(\a*\)er /more \1 /g   # taller man -> more tall man
:1,20  s///g    
:1,$   s///g
:%     s///g        
:.,$   s///g
:.,+10 s///g
###  replace
:% s/four/4/g
:% s/\<four/4/g
:% s/\<four\>/4/g
:% s/\<four\>/4/gc

### search & replace, from line head;
:%s/\%100c\%5v//
:%s/^\(.........\)//g

## exchange 
:% s/\([^,]*\),\(.*\)/\2\1/

# count number of matches of a pattern
:%s/<pattern>/ng
:%s///ng; # search first match, then count all matched pattern;

# search/grep file under cursor, and count
:command! -nargs=1 Grepc execute ':!grep <args> ' . expand('<cfile>')
:Grepc "EQ 0"  | wc -l; ctrl-c;

### record/replay
qaq, @a, 20@a;

## replace for multiple files
vim *.cpp;
qa 
: % s/\<ABC\>/XYZ/g
: % s/\<ABC\>/XYZ/ge  #do not report Error when cannot find <ABC>
:wn
q
@a
999@a


### delete blanks of line ends
:%s/\s\t$//   / n

###  open, close, retrace, pretrace
:E :e ctrl-w  ctrl-]  ctrl-t

###  count words
g  ctrl-G

# find blanks before tabs
/ n

### find words
csh> vim `grep -l XYZ *.c`

# find every line
:grep XYZ *.c
:cn 
:clist
:cp

#### fold :  Using zc and zo to hide portions of text based on indented sections
:help usr_28;  # 
:set foldmethod ; # default is manual;
:set foldmethod =manual;
:set foldmethod =syntax; # fold by syntax, e.g, python: indent, c/cpp: {}; verilog: module/endmodule, begin/end, 
:zfap;  # fold current paragraph;
:zf7j;  # fold next 7 lines;
:zfn;   # fold until next matched word; 
vj zf;  # visual select and move down, fold selected line;
:za;    # toggle between fold/unfold;   
nnoremap <space> za ; # map za to space;
:zo/zc; # fold on; zc: fold close;
:1,100 fold;     # fold line1 to 100;
:.,+200 fold;    # fold following 200 lines;
:1,100 foldopen; # unfold line1 to 100;
:foldclose;
:foldopen;
:zM,zR; # open/close all folds

# fold next 1000+ lines by selected parts ( if same, hide all lines)
/^\%(.*AABBCC.*\)\@!; zfn;

### orthodox vim
c/d/v    # correct/delete/visual_select
iw/it/ib # for word/tag/blocks_braces,  3*3=9 combinations, (innner, around, to be included))
d$:  delete till EOL;
cib: correct inside block; 

## dit:  delete all the "<Th" lines;
# move cursor to tr, then click "dit", it's OK.
<thead>
<tr>
        <th class="title_8">status</th>
        <th class="title_9 middle">topic</th>
        <th class="title_10">time</th>
        <th class="title_12">| author</th>
............................................................................................
        <th class="title_11 middle">reply</th>
        <th class="title_10">new reply</th>
        <th class="title_12">| author</th></tr>
</thead>

# should be changed into:
<thead>
<tr></tr>
</thead>

## va( : to select all contents inside (), including () itself.
# move cursor to "(", click "va(", it's OK.
       rtn = WlanConnect(hClientHandle,
                        &pInterfaceList->InterfaceInfo[pInterfaceList->dwIndex].InterfaceGuid,
                        &sWLANConnParam,
                         NULL);

#### 
dit # means Delete Inner Tag
va( # means Visual select A (
da( # means delete A (
cib # change inside (abc), () not touched
cab # change around (XYZ), () deleted;
yib # copy inside, not include ();
yab # copy around, include (); = y%
y%  # or move cursor to "(", y%, same as yab;
# use "block" concept

# " buffer/window/tab navigation mappings

# " goto upper/lower window and max it
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_

# " goto neighbour
nmap <A-h> <C-W>h
nmap <A-j> <C-W>j
nmap <A-k> <C-W>k
nmap <A-l> <C-W>l

# " tab navigation
nmap <C-TAB> :tabnext<CR>
nmap <C-S-TAB> :tabpre<CR>
 
#### vim systemverilog pack
git clone https://github.com/nachumk/systemverilog.vim ~/.vim/pack/systemverilog.vim
# verilog syntax highlighting and indenting, and additional features (if enabled via .vimrc):
# matchit - Using shift-5 (%) to hop between starting and ending tokens,e.g, 
# begin → end → begin; module → endmodule → module ; ( → ) → ( ; function → endfunction → function
# Replacing tabs with spaces by re-indenting the complete file

#### vim cursor blink speed as 1600ms per cycle
~/.vimrc
:set guicursor+=a:blinkon800
:set guicursor+=a:blinkoff800
:set guicursor+=a:blinkwait300

#### vim colorscheme
# download github.com/sickill/vim-monokai/colors/monokai.vim
# save monokai.vim into ~/.vim/colors/monokai.vim (for win, into vim\colors\monokai,vim)
# vi ~/.vimrc, add "colorscheme monokai"
:colors monokai; colors default;

:colorscheme blue|darkblue|delek|desert|elflord|everning|morning
# https://github.com/chriskempson/tomorrow-theme/tree/master/vim/colors
# https://github.com/chriskempson/tomorrow-theme/blob/master/vim/colors/Tomorrow-Night-Blue.vim
:colorscheme Tomorrow-Night
# Tomorrow-Night-Bright.vim Tomorrow-Night-Eighties.vim Tomorrow-Night.vim TomorrowNight.vim

# random colors
random_color ={ 'kanagawa', 'gruvbox', 'nord', 'neon','leaf','adwaita','melange','onedark','monokai'}
math.randomseed(os.time())
local mycolor= random_color[math.random(10)]
vim.cmd('colorscheme',..mycolor)
# neodark
# everforest
# sonokai
# aurora
# everblush
# zephyrium
# substrata
# vscode

## vim legacy colors
:color darkblue
:color koehler
:color murphy
:color elflord
:color evening; # Warning info will be light-yellow, hard to recognize; 

#### colorscheme 256_noir
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212




