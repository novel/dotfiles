#!/bin/sh

import --version > /dev/null 2>&1 || echo "ImageMagic is not installed!"
xclip -help > /dev/null 2>&1 || echo "xclip is not installed!"

# whether to screenshot root window or allow user to choose region
root_window=0
# whether to output to a file or to a clipboard
to_file=0

args=$(getopt fr $*)
if test $? -ne 0; then
  echo "Usage: $0 [-f] [-r]"
  exit 2
fi
set -- $args
while :; do
  case "$1" in
  -f)
    to_file=1
    shift
    ;;
  -r)
    root_window=1
    shift
    ;;
  --)
    shift; break
    ;;
  esac
done

import_opts=""
if test ${root_window} -eq 1; then
   import_opts="${import_opts} -window root"
fi

if test ${to_file} -eq 1; then
  filename="screenshot-$(date +%Y%m%d%H%M%S).png"
  import_opts="${import_opts} ${filename}"
else
  import_opts="${import_opts} png:-"
fi

if test ${to_file} -eq 1; then
  import ${import_opts}
else
  import ${import_opts}|xclip -t image/png
fi
