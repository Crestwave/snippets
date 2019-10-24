#!/bin/sh
# Local variables in POSIX sh

a() {
    var=local
    echo "$var"
    var2=global
    echo "$var2"
}

alias a='var= a'

a
echo "${var-unset}"
echo "${var2-unset}"
unset var var2

# Bash-compatible
_b() {
    var=local
    echo "$var"
    var2=global
    echo "$var2"
}

b() {
    var= _b
}

b
echo "${var-unset}"
echo "${var2-unset}"
