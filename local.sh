#!/bin/sh
# Local variables in POSIX sh

a() {
    var=1
    echo "$var"
}

alias a='var= a'

a
echo "${var-unset}"
unset var

# Bash-compatible
_b() {
    var=1
    echo "$var"
}

b() {
    var= _b
}

b
echo "${var-unset}"
