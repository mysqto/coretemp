#!/usr/bin/env bash

if [ ! -f ".clang-format" ]; then
    echo ".clang-format file not found!"
    exit 1
fi

failures=0

while IFS= read -r -d '' file
do
    echo "Checking ${file}"
    tmp="$(mktemp)"
    clang-format -style=file "${file}" > "${tmp}"
    diff -u "${tmp}" "${file}"
    if [[ $? -gt 0 ]]; then
        failures=$((failures + 1))
    fi
    rm "${tmp}"
done < <(find . -name '*.c' -o -name '*.h')

[[ "${failures}" -eq 0 ]] || exit 1
