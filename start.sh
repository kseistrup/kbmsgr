#!/bin/bash

# Normally, you would copy src/kbmsgr* to a directory in your $PATH,
# e.g. ~/.local/bin/ or /usr/local/bin/, but those who want to run it
# directkly from the git clone can do it by executing this script.

[[ "${#}" != 2 ]] && {

  echo "usage: ./start.sh <self> <other>"
  exit 1

}
PATH="./src:${PATH}" exec kbmsgr "${@}"

# eof
