#!/usr/bin/env bash
HISTSIZE="$1" history -n "$2"
fc -ln
