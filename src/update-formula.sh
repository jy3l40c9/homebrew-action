#!/usr/bin/env bash
# https://github.com/cssnr/homebrew-action

set -e

key="${1}"
value="${2}"

if [ -z "${value}" ];then
    echo "Skipping: ${key} - not provided."
    exit 0
fi

echo -e "::group::\033[1;33m Processing: \033[1;36m${key}\033[0m"
echo "value: ${value}"

# shellcheck disable=SC2154
line=$(grep -n -m1 '^[[:space:]]*'"${key} " "${formula}" | cut -f1 -d:)
echo "line: ${line}"
sed -i "${line}"'s,.*,'"  ${key} \"${value}\"," "${formula}"

echo "::endgroup::"
