#!/bin/bash

## this setup of ssh-alias, ssh alias helps to save pub key to server while loging into servers via --save flag 
## Author - Anil Chauhan (https://github.com/meanii)


SSH_ALIAS_LINK="https://raw.githubusercontent.com/meanii/ssh-alias/main/ssh.sh"
INSTALLED_PATH=~/.meanii/ssh.sh

mkdir -p ~/.meanii/
curl -o $INSTALLED_PATH $SSH_ALIAS_LINK

if [[ -f ~/.zshrc ]]; then
    echo 'alias ssh="bash '$INSTALLED_PATH'"' >> ~/.zshrc
elif [[ -f ~/.bashrc ]]; then
    echo 'alias ssh="bash '$INSTALLED_PATH'"' >> ~/.bashrc
else
    echo 'alias ssh="bash '$INSTALLED_PATH'"' >> ~/.bashrc
fi

echo "succesfully install ssh-alias ✅"
echo "source ~/.bashrc ~/.bashrc to refresh your terminal instance"
echo "Example: ssh root@hostname --save"