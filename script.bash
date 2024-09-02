#!/bin/bash

# функция, которая переводит из десятичной в 2-ную систему с доп. нулями до 8ми бит
dec_to_bin() {
    echo "obase=2; $1" | bc | awk '{printf "%08d", $0}'
}

# проверяю наличие самого аргумента (IP-адреса)
if [ -z "$1" ]; then
    echo "Использование: $0 <IPv4-адрес>"
    exit 1
fi

# разделяю IP-адрес на октеты
IFS='.' read -r -a octets <<< "$1"

# преобразую каждый октет в двоичный формат и объединяю их с точками
binary_ip=$(printf "%s.%s.%s.%s\n" \
    "$(dec_to_bin "${octets[0]}")" \
    "$(dec_to_bin "${octets[1]}")" \
    "$(dec_to_bin "${octets[2]}")" \
    "$(dec_to_bin "${octets[3]}")")

# вывод результата
echo "$binary_ip"

