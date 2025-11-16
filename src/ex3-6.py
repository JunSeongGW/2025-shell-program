#!/usr/bin/env python3
import sys

if len(sys.argv) < 3:
    print(f"사용법: {sys.argv[0]} <arg1> <arg2> [more args...]")
    sys.exit(1)

print("=== Python 실행파일 시작 ===")

print(f"실행 파일 이름: {sys.argv[0]}")
print("입력된 인자들:")

for i, arg in enumerate(sys.argv[1:], start=1):
    print(f"  인자 {i}: {arg}")

print("=== Python 실행파일 종료 ===")
