#!/bin/sh
# Arithmetic tests/evaluation (`let` in Bash)  in pure POSIX sh
let() {
	return $(( ! ($@) ))
}

let '4 > 2 && 0 < 1'
printf '%s\n' $?
let 'i += (6 * 5)' # i++ is not POSIX
printf '%s\n' "$i"
let $# && let "$@"
