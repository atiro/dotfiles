# Install packages

# ag (grep replacement) - https://github.com/ggreer/the_silver_searcher

sudo apt-get install install silversearch-ag

# Setup link to bash-git-prompt

# Append to bashrc
# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# source ~/.bash-git-prompt/gitprompt.sh
# 

# Desk setup
cp desk/desk ~/bin

desk init

# Liquidprompt setup

ln -s liquidprompt/liquidprompt ~/bin/liquidprompt
