#!/bin/bash

# Script to delete branches (locally & in origin) that have been merged into master


prompt_user() {
    read -p "Do you want to continue? " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Stopping."
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
    fi
}

# Delete local branches
echo
echo "Deleting unmerged branches locally .."
BRANCHES=$(git branch --merged master| egrep -v "(^\*|master|dev|develop)")
if [[ -z "${BRANCHES}" ]]
then
    echo "No unmerged branches found locally"
else
    echo "The following local merged branches will be deleted:"
    echo
    echo "${BRANCHES}"
    echo

    prompt_user
    echo "${BRANCHES}" | xargs git branch -d
fi


# Delete branches on remote
echo
echo "Deleting unmerged branches on remote origin .."
BRANCHES=$(git branch -r --merged master| grep origin | egrep -v "(^\*|master|dev|develop)")
if [[ -z "${BRANCHES}" ]]
then
    echo "No unmerged branches found in origin"
    exit 1
else
    echo "The following merged branches in remote 'origin' will be deleted:"
    echo
    echo "${BRANCHES}"
    echo
fi

# prompt_user
# echo "${BRANCHES}" | sed 's:/: :g' | xargs -n 2 git push --delete

# # Prune remote-tracking branches
# echo
# echo "Pruning remote-tracking branches locally .."
# prompt_user
# echo "${BRANCHES}" | xargs git branch -dr


echo "Done"
echo
