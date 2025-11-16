#!/bin/bash
echo "======================"
echo "  시스템 상태 확인 메뉴"
echo "======================"
echo "1) 사용자 정보"
echo "2) GPU 또는 CPU 사용률 확인"
echo "3) 메모리 사용량 확인"
echo "4) 디스크 사용량 확인"
echo "======================"
read menu
case "$menu" in
    1)
        echo
        echo "▶ 현재 로그인한 사용자 정보"
        who
        echo
        echo "▶ 현재 사용자(id) 상세 정보"
        id
        ;;
    2)
        echo
        echo "▶ GPU 또는 CPU 사용률 확인"
        if command -v nvidia-smi >/dev/null 2>&1; then
            echo "[GPU 사용률 - nvidia-smi]"
            nvidia-smi
        else
            echo "[CPU 사용률 - top (요약)]"
            top -b -n 1 | head -n 5
        fi
        ;;
    3)
        echo
        echo "▶ 메모리 사용량 확인 (free -h)"
        free -h
        ;;
    4)
        echo
        echo "▶ 디스크 사용량 확인 (df -h)"
        df -h
        ;;
    *)
        echo "⚠ 1~4 중에서 선택하세요."
        ;;
esac
