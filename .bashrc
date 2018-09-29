export EMACSCLIENT=emacsclient
export RUNEMACS=emacs


alias emacsclientw=$EMACSCLIENT
alias runemacs=$RUNEMACS

export GIT_EDITOR="$RUNEMACS -nw"
export VISUAL="open -a emacs"
export EDITOR="$RUNEMACS -nw"

export PATH=/usr/local/bin:$PATH
export FLAGS_GETOPT_CMD_DIR="$(brew --prefix gnu-getopt)/bin/"
export FLAGS_GETOPT_CMD=$FLAGS_GETOPT_CMD_DIR"getopt"
export PATH=$FLAGS_GETOPT_CMD_DIR:$PATH

# export JAVA_HOME=$(/usr/libexec/java_home)

# Setting up the EC2 home
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.6.12.2/
export PATH=$EC2_HOME/bin:$PATH

#Storing bash hisotry in multiple child bash sessions, tmux/screen 
# I am looking at you

#avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# append history entries
# shopt -s histappend

#After each command, save and reload history
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# oracle instant client settings
DYLD_LIBRARY_PATH="/usr/local/oracle/instantclient_11_2"
export DYLD_LIBRARY_PATH
SQLPATH=$DYLD_LIBRARY_PATH
export SQLPATH
PATH=$SQLPATH:$PATH

#XUL RUNNER PATH
XULRUNNER_PATH=~/Library/xulrunner-sdk/bin
SWT_PATH=~/Library/swt
PATH=$SWT_PATH:$XULRUNNER_PATH:$PATH


readonly HOMEBREWTAGS=/usr/local/Cellar/ctags/5.8/bin/ctags
alias bctags=$HOMEBREWTAGS

#Packer environment variable
export PATH=$PATH:/usr/local/packer

#open an argumemt in Dash
function dash() {
    open "dash://$*"
}

export GITAWAREPROMPT=~/.bash.d/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# Customized Prompt
export PS1="\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] $ "

export GITEXTENSIONSPATH=~/.gitextensions/
PATH=$GITEXTENSIONSPATH:$PATH

export OPENSSLPATH="/usr/local/opt/openssl/bin/"
PATH=$OPENSSLPATH:$PATH

export JREBEL_PATH="/Users/hkhanhex/projects/jr-ide-idea/lib/jrebel6/lib"

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

export HOMEBREW_GITHUB_API_TOKEN= {{ insert your github token here }}

# add path for exercism
export EXERCISM_PATH=/Users/hkhanhex/projects/exercism-mac
export PATH=$EXERCISM_PATH:$PATH

# Setup jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


