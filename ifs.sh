#!/bin/sh
IFS=: set --
printf '%s\n' "$IFS"
unset IFS
var=a:b
IFS=: set -- $var
printf '%s\n' "$1"
