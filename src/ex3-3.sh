#!/bin/bash

echo "점수들을 입력하세요 (예: 95 70 88 100): "
read -a scores    
total=0
count=${#scores[@]}

echo "-------------------------------"
echo "[각 과목 등급]"
for s in "${scores[@]}"; do

    if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
        echo "점수 $s 는 잘못된 입력입니다 (0~100)"
        exit 1
    fi

    if [ "$s" -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi

    echo "점수: $s → 등급: $grade"

    total=$(( total + s ))
done

echo "-------------------------------"

avg=$(( total / count ))

if [ "$avg" -ge 90 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "[평균 점수] $avg"
echo "[평균 등급] $avg_grade"
echo "-------------------------------"
