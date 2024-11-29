# gvim_csh
git_win64, gvim,csh,python,dumptb;

git clone https://github.com/dawabala/gvim_csh;

git checkout main -- README.md;

gvim README.md;

git status;

git add README.md; # git add .

git commit -m "update readme";

git push origin main;

git pull origin main; # get latest changes from remove repository;

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

# undo when add & commit unnecessary files;
git reset <filename>; 
git reset;
git status;

# discard changes, revert to last commit;
git restore *;


