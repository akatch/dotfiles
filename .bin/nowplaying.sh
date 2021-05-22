#!/bin/bash

eval $(cmus-remote -Q | grep 'status\| artist \|title' | sed 's/\(tag \)\?\([a-z]\+\) \(.*\)/\2="\3"/g')
[[ "$status" == "playing" ]] && printf "$artist: $title "
