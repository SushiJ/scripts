#!/bin/sh

updates=$(apt list --upgradable  2>/dev/null| wc -l)

if [ "$updates" -gt 1 ]; then
    echo "%{F#8ABEB7} %{F-} $(expr $updates - 1)"
else
    echo ""
fi
