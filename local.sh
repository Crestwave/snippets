#!/bin/sh
# Local variables in POSIX sh

a() {
    var=local
    var2=global
    printf '%s\n' "$var $var2"
}

alias a='var= a'

a
printf '%s\n' "${var-unset} ${var2-unset}"
unset var var2

# Bash-compatible
_b() {
    var=local
    var2=global
    printf '%s\n' "$var $var2"
}

b() {
    var= _b
}

b
printf '%s\n' "${var-unset} ${var2-unset}"
