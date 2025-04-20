# mail: j***@***.com 
# word: S###T###;
# user: dawabala

# gvim_csh

# git_win64, gvim,csh,python,dumptb;

git clone https://github.com/dawabala/gvim_csh;

git checkout main -- README.md;

gvim README.md;

git status;

git diff <filename>

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

# in Linux, config user.name, user.email,  git clone, create token, git push: to confirm username and token(no need for password), then save it.  
git config --list
git config --global user.name "dawabala"
git config --global user.email "jerryzhu_sh@163.com"
git config --global credential.helper store

git clone https://github.com/dawabala/gvim_csh
git add *.csh; git commit "add *.csh"; git push;
# in GitHub.com/dawabala, settings/developer settings/personal access tokens(classic), 

# github/*/gvim_csh
username: da****; 
passwd:  
ghp_Vqym0rDnNCv<*>5cjtJcnkMlBImz4LKE2<*>YvEs ; 
# * as your firstname/secondname;


# GitHub token
Generate a Personal Access Token on GitHub
A personal access token on GitHub functions like an OAuth access token and authenticates the access to the GitHub API.
1) Navigate to your Git account settings, then Developer Settings. Click the Personal access tokens menu, then click Generate new token.  
2) Select repo as the scope. The token will be applicable for all the specified actions in your repositories.  
3) Click Generate Token. GitHub will display the personal access token only once. Ensure that you copy the token and store it in a safe space.  
We will use this token in the Integration function’s code, which will enable Catalyst to fetch necessary information about the repositories from GitHub.



