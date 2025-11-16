#!/bin/bash

scores=() 

while true; do
    echo "===================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 변환"
    echo "5) 종료"
    echo "===================="
    read menu

    case "$menu" in
        1)
            echo -n "추가할 점수(0~100)를 입력하세요: "
            read s
            if ! [[ "$s" =~ ^[0-9]+$ ]]; then
                echo "⚠ 숫자만 입력하세요."
                continue
            fi
            if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
                echo "⚠ 점수는 0~100 사이여야 합니다."
                continue
            fi

            scores+=("$s")
            echo "✔ 점수 $s 추가 완료."
            ;;

        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "⚠ 아직 입력된 점수가 없습니다."
            else
                echo "입력된 점수 목록:"
                for i in "${!scores[@]}"; do
                    idx=$((i+1))
                    echo "  $idx) ${scores[$i]}"
                done
            fi
            ;;

        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "⚠ 평균을 계산할 점수가 없습니다."
            else
                total=0
                for s in "${scores[@]}"; do
                    total=$(( total + s ))
                done
                avg=$(( total / ${#scores[@]} ))
                echo "평균 점수: $avg"
            fi
            ;;

        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "⚠ 평균 등급을 계산할 점수가 없습니다."
            else
                total=0
                for s in "${scores[@]}"; do
                    total=$(( total + s ))
                done
                if   [ "$avg" -ge 90 ]; then
                    gpa="4.0 (A)"
                elif [ "$avg" -ge 80 ]; then
                    gpa="3.0 (B)"
                elif [ "$avg" -ge 70 ]; then
                    gpa="2.0 (C)"
                elif [ "$avg" -ge 60 ]; then
                    gpa="1.0 (D)"
                else
                    gpa="0.0 (F)"
                fi
                echo "평균 점수: $avg"
                echo "평균 등급(GPA): $gpa"
            fi
            ;;

        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;

        *)
            echo "⚠ 1~5 사이의 숫자를 입력하세요."
            ;;
    esac
done
