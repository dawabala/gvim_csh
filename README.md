# gvim_csh
git_win64, gvim,csh,python,dumptb;

git clone https://github.com/dawabala/gvim_csh;

git checkout main -- README.md;

gvim README.md;

git status;

git add README.md; # git add .

git commit -m "update readme";

git push origin main;



# config username, emails
git config --global --edit; # user: Dong  email: dong;
git config --global user.name "Dong"
git config --global user.email dong
git commit --amend --reset-author
git config --list

# sync, merge;
git status;
# git fetch; # not always update latest files; 
git pull;
git add; 
git commit -m " " ;

#### 
git pull origin main; # get latest changes from remove repository;

# undo when add & commit unnecessary files;
git reset <filename>; 
git reset;
git status;

# discard changes, revert to last commit;
git restore *;

# revert/restore a file  to old version
git log --oneline;  # d268f6e add Linux.txt, add orthodox gvim;
git checkout d268f6e dumptb.py
git status
git add dumptb.py monokai.vim q13_tb.v
git commit -m "restore dumptb.py, add chatgpt into q13_tb.v, add monokai.vim"
git push origin main



