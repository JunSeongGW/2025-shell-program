#!/bin/bash

echo "y = 1/2 * x^2 를 계산합니다."
echo -n "계산할 x 값을 여러 개 입력하세요 (예: 1.2 3 4.5): "
read -a arr

echo "------------------------------------"

for x in "${arr[@]}"; do
    y=$(echo "scale=5; 0.5 * ($x * $x)" | bc)

    echo "x = $x → y = $y"
done

echo "------------------------------------"
