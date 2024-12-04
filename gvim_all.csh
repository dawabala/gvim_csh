
# windows shortcut  popup  menus
copy gvimext32/gvimext.dll into windows/system/ & windows/system32/; 
copy libintl-8.dll into windows/system;
regedit: HKEY_LOCAL_MACHINE/software/vim/gvim,  is used by gvimext.dll; 
       value "path" specified location of "gvim.ext"; value "lang" set languages, e.g "de";
github.com/vim/vim-win32-installer/releases

./vim/
# Yan Pritzker, learn to peak vim -verbs, nouns and modifiers
# verbs d: delete, r:replace, y:yank, v:visual(select);
# nouns w: word, s:setence, p:paragraph,
# modifiers  i:inside, a:around, t:till(not include), f:find(include);
diw: delete inside word  cis:change inside setence
dte: delete till e       vis:visual inside setence
dis: delete inside setence  dit: delete inside tag(html/xml);
gUis/gUip: change upper case inside sentence/paragraph;
guis/guip: change lower case inside sentence/paragraph;
guiw/gUiw: change lower/upper case inside word;


:mk   # save settings into _exrc;
:sh   # open command line; exit to return into gvim ;
:mks session1.vim;        # save current session;
csh> vim -S session1.vim; # reload session;
vim> source session1.vim; # reload session;
vim> :mkview v1.vim ;   # save view;
vim> source v1.vim; # load view;
vim> :loadview v1.vim; # load view;

#### ctags
csh> ctags -R 1.txt;  gvim 1.txt;
gvim> ctrl-]; ctrl-T; ctrl-6; <mouse_double_click>; g<mouse_right>;

## setup, 
:syn on;   # syntax on/off
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
sorting lines in editors
vi: :.,+3!sort

### for every defines/params in header.h, replace it in tdatq.v;  
:%s/`NUM_GRP`/86/g  ; # replace current search patterns(e.g, `NUM_GRP) into 86;
:,$s//86/g ;          # replace pattern, from current line to last line;
# header file "`define WIDTH = 16", save as mapping.mid_def.txt; gvim ":%s#define #150,$s/#g", ":%s# #/#g", ":%s#$#/g#g" ; mapping.vim.txt: ":150,$ s/WIDTH/16/g";
# params file "parameter DEPTH=43", save as mapping.txt; gvim ":%s#^#150,$s/#g",   
gvim tdatq.v;
gvim> :source mapping.vim.txt;
# if gvim pauses for every 25 lines, :set nomore (:set more otherwise)
gvim> set nomore

### vertical select and increment/decrement numbers;
ctrl-v to select vertically; 
g ctrl-a to increment;  g ctrl-x to decrement;
1
1
1
1

###



