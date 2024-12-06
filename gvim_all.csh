
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
ctrl-v to select vertically; 
g ctrl-a to increment;  g ctrl-x to decrement;
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

###  replace
:% s/four/4/g
:% s/\<four/4/g
:% s/\<four\>/4/g
:% s/\<four\>/4/gc

## exchange 
:% s/\([^,]*\),\(.*\)/\2\1/

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

### search 
:/`\U.*\d ; # search "`MID_DEF_*=18"; "


# find every line
:grep XYZ *.c
:cn 
:clist
:cp

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
 



