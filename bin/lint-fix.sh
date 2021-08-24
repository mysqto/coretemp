#!/usr/bin/env bash

if [ ! -f ".clang-format" ]; then
    echo ".clang-format file not found!"
    exit 1
fi

changed=0

while IFS= read -r -d '' file
do
    tmp="$(mktemp)"
    clang-format -style=file "${file}" > "${tmp}"
    if cmp "${tmp}" "${file}" >/dev/null; then
        rm "${tmp}"
    else
        mv "${tmp}" "${file}"
        echo "Formatted ${file}"
        changed=1
    fi
done <   <(find . -name '*.c' -o -name '*.h')

if [[ "${changed}" -eq 0 ]]; then
    echo "Already formatted"
fi
