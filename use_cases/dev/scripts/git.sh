#!/usr/bin/env bash

function git-clone() {
    CURRENT_DIR=`pwd`

    REPO=$1
    NAME=${2-""}
    WORK_DIR=${3-""}

    if [ ! -z "$CURRENT_DIR/$WORK_DIR" ]; then
        cd $CURRENT_DIR/$WORK_DIR
    fi

    CLONE=1
    if [ -z "$CURRENT_DIR/$WORK_DIR/$NAME" ]; then
        cd $CURRENT_DIR/$WORK_DIR/$NAME

        IS_REPO=$(git rev-parse --is-inside-work-tree)

        echo "repo: $IS_REPO"

        if [ "$IS_REPO" = "true" ]; then
            CLONE=0
        fi
        
        cd $CURRENT_DIR/$WORK_DIR
    fi

    if [ $CLONE ]; then
        git clone $REPO $NAME
    fi

    cd $CURRENT_DIR
}

function git-checkout-branch() {
    CURRENT_DIR=`pwd`

    WORK_DIR=${1-""}
    BRANCH=${2-"main"}

    if [ ! -z "$WORK_DIR" ]; then
        cd $WORK_DIR
    fi

    git switch $BRANCH 2>/dev/null || git switch -c $BRANCH

    cd $CURRENT_DIR
}

$*
