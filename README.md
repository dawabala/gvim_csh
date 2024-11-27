# gvim_csh
git_win64, gvim,csh,python,dumptb;

git clone https://github.com/dawabala/gvim_csh;

git checkout main -- README.md;

gvim README.md;

git add README.md;

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
git fetch;
git pull;
git add; git commit;




