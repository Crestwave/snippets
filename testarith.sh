#!/bin/sh
# Arithmetic tests/evaluation (`((` in Bash)  in pure POSIX sh
testarith() {
	return $(( ! ($@) ))
}

testarith '4 > 2 && 0 < 1'
printf '%s\n' $?
testarith $# && testarith "$@"
