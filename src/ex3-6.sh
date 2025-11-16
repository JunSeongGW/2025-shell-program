#!/bin/bash

if [ $# -lt 2 ]; then
    echo "사용법: $0 <arg1> <arg2> [more args...]"
    exit 1
fi

echo "=== ex3-6.sh 시작 ==="
for i in "$@"; do
    echo "  $i"
done

echo "→ Python 실행파일(myprog.py)을 인자와 함께 실행합니다."
echo

./ex3-6.py "$@"

echo
echo "=== ex3-6.sh 종료 ==="
