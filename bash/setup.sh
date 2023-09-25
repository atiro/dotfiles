# Install packages

# ag (grep replacement) - https://github.com/ggreer/the_silver_searcher

sudo apt-get install silversearcher-ag 

# Quick directory jumping

sudo apt-get install autojump

# Code line counter util

sudo apt-get install cloc

# Powerline bash/vim shell prompt

sudo apt-get powerline fonts-powerline

# Setup link to bash-git-prompt

# Append to bashrc
# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# source ~/.bash-git-prompt/gitprompt.sh
# 

# Desk setup
cp desk/desk ~/bin

desk init

# Virtualenv / Node

sudo pip install virtualenv virtualenvwrapper

mkvirtualenv default
workon default

pip install nodeenv

# Report on website status

pip install isitup

# Saws (better AWS command line tool) - https://github.com/donnemartin/saws

#pip install saws

# Takes a long time to compile
#nodeenv -p

# Now install some node stuff

# Show IPs on worlkdmap in terminal (https://github.com/nogizhopaboroda/iponmap)

npm install -g iponmap
