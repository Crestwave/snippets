#!/bin/sh -f
str=$1

IFS=' '
set -- $str
IFS=
IFS=$*

set +f -- $str
IFS=
spaces=$*

printf '%s\n' "${#spaces}"
