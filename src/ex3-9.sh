#!/bin/bash
DB_FILE="DB.txt"
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi
add_member() {
    echo "=== 팀원 정보 추가 ==="
    read -p "이름: " name
    read -p "생일 (예: 2001-07-11, 없으면 엔터): " birthday
    read -p "전화번호 (예: 010-1234-5678, 없으면 엔터): " phone

    echo "MEM|$name|$birthday|$phone" >> "$DB_FILE"
    echo "✔ 팀원 정보가 DB.txt에 추가되었습니다."
}

add_work() {
    echo "=== 팀원과 한 일 기록 ==="
    read -p "날짜 (예: 2025-11-16): " date
    read -p "팀원 이름: " name
    echo -n "수행 내용(한 줄로 입력): "
    read -r work

    echo "LOG|$date|$name|$work" >> "$DB_FILE"
    echo "✔ 수행 내용이 DB.txt에 추가되었습니다."
}

search_by_name() {
    echo "=== 팀원 검색 ==="
    read -p "검색할 팀원 이름: " name

    echo "----- [팀원 기본 정보] -----"
    grep "^MEM|$name|" "$DB_FILE" | awk -F'|' '
        { 
          printf "이름: %s\n생일: %s\n전화번호: %s\n\n", $2, $3, $4
        }
    ' 
    if ! grep -q "^MEM|$name|" "$DB_FILE"; then
        echo "해당 이름의 팀원 정보가 없습니다."
    fi

    echo "----- [해당 팀원과 한 일 기록] -----"
    grep "^LOG|.*|$name|" "$DB_FILE" | awk -F'|' '
        {
          printf "날짜: %s\n이름: %s\n내용: %s\n\n", $2, $3, $4
        }
    '
    if ! grep -q "^LOG|.*|$name|" "$DB_FILE"; then
        echo "해당 팀원과 관련된 수행 기록이 없습니다."
    fi
}

search_by_date() {
    echo "=== 수행 내용 검색 (날짜 기준) ==="
    read -p "검색할 날짜 (예: 2025-11-16): " date

    grep "^LOG|$date|" "$DB_FILE" | awk -F'|' '
        {
          printf "날짜: %s\n이름: %s\n내용: %s\n\n", $2, $3, $4
        }
    '

    if ! grep -q "^LOG|$date|" "$DB_FILE"; then
        echo "해당 날짜의 수행 기록이 없습니다."
    fi
}

while true; do
    echo "==================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "==================="
    read -p "메뉴를 선택하세요 (1-5): " menu

    case "$menu" in
        1)
            add_member
            ;;
        2)
            add_work
            ;;
        3)
            search_by_name
            ;;
        4)
            search_by_date
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "⚠ 1~5 중에서 선택하세요."
            ;;
    esac

    echo
done
