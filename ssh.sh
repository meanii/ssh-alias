#!/bin/bash

## this ssh alias helps to save pub key to server while loging into servers via --save flag 
## Author - Anil Chauhan (https://github.com/meanii)

## VARIBALES 
ARGS="$@"
ACTIVATE_SAVE_SSH_KEY="--save"

AUTHORIED_KEYS_PATH="~/.ssh/authorized_keys"
PUBLIC_KEY_PATH=~/.ssh/id_rsa.pub

PUBLIC_KEY=$(cat "$PUBLIC_KEY_PATH")

## HELPER FUNCTIONS
function isFileExists() {
    if [[ -f "$1" ]]; then
        return 0
    else 
        return 1
    fi
}

function saveSSH() {
    if [[ "$ARGS" == *"$ACTIVATE_SAVE_SSH_KEY"* ]]; then
        
        # chicking if $PUBLIC_KEY_PATH exist or not
        if isFileExists $PUBLIC_KEY_PATH; then OK=0; else ssh-keygen; fi

        ARGS=$(echo $ARGS | sed "s|$ACTIVATE_SAVE_SSH_KEY||g")  # saving key to server
        ssh $ARGS /bin/bash << EOF
mkdir -p ~/.ssh2 # making sure for ~/.ssh
/bin/echo ${PUBLIC_KEY} >> ${AUTHORIED_KEYS_PATH}
EOF
    ssh $ARGS # login to server after saving key 
    else
        ssh $ARGS
    fi
}

## main tread
saveSSH;