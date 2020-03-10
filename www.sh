#!/usr/bin/env bash
if [[ $1 != https://www* ]]; then
	printf 'Url must start with www\n' >&2
	exit 1
fi
