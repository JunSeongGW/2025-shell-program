#!/bin/bash

# 인자가 2개인지 확인
if [ $# -ne 2 ]; then
    echo "사용법: $0 <num1> <num2>"
    exit 1
fi

# 파라미터 변수 저장
num1=$1
num2=$2

# 정수 사칙연산
add=$(( num1 + num2 ))
sub=$(( num1 - num2 ))
mul=$(( num1 * num2 ))

# 나눗셈은 0 나누기 방지
if [ $num2 -eq 0 ]; then
    div="0으로 나눌 수 없습니다"
else
    div=$(( num1 / num2 ))
fi

# 결과 출력
echo "num1 = $num1, num2 = $num2"
echo "더하기: $add"
echo "빼기: $sub"
echo "곱하기: $mul"
echo "나누기: $div"
