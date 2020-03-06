#!/bin/sh -f
str=$1

IFS=' '
set -- $str
IFS=
IFS=$*

set +f -- $str
IFS=
spaces=$*

unset IFS
printf '%s\n' "${#spaces}"
