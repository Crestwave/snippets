#!/bin/sh
LC_ALL=C
IFS=' '
n='
'
val=0

let() {
	return $((!($@)))
}

if let $#; then
	while read -r line || let ${#line}; do
		prog=$prog$line
	done < "$1" || exit
else
	while read -r line || let ${#line}; do
		prog=$prog$line
	done
fi

while :; do
	case $prog in
		'>'*)
			set -- ${tape_right:-0}
			tape_left="$val $tape_left"
			val=$1
			shift
			tape_right=$*
			;;
		'<'*)
			set -- ${tape_left:-0}
			tape_right="$val $tape_right"
			val=$1
			shift
			tape_left=$*
			;;
		'+'*)
			val=$(( val + 1 ))
			let 'val == 256' && val=0
			;;
		'-'*)
			val=$(( val - 1 ))
			let 'val == -1' && val=255
			;;
		'.'*)
			printf "\\$(printf %o "$val")"
			;;
		','*)
			let !${#input} && read -r input && input=$input$n

			if let ${#input}; then
				val=$(printf %d "'${input%"${input#?}"}")
				input=${input#?}
			fi
			;;
		'['*)
			if let !val; then
				depth=1
				while let depth; do
					bak=${prog%"${prog#["><+-.,[]"]}"}$bak
					prog=${prog#?}
					case $prog in
						'['*) depth=$(( depth + 1 )) ;;
						']'*) depth=$(( depth - 1 )) ;;
					esac
				done
			fi
			;;
		']'*)
			if let val; then
				depth=1
				while let depth; do
					case $bak in
						'['*) depth=$(( depth - 1 )) ;;
						']'*) depth=$(( depth + 1 )) ;;
					esac
					prog=${bak%"${bak#?}"}$prog
					bak=${bak#?}
				done
			fi
			;;
		'')
			break
			;;
		*)
			prog=${prog#?}
			continue
			;;
	esac
	bak=${prog%"${prog#?}"}$bak
	prog=${prog#?}
done
