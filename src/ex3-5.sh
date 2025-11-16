#!/bin/bash

run_cmd() {
    cmd="ls $1"
    echo "실행 명령: $cmd"
    eval $cmd
}

if [ $# -eq 0 ]; then
    echo "사용법: $0 <ls옵션>"
    echo "예: $0 -al"
    exit 1
fi

run_cmd "$1"
