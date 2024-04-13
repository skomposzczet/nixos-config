#!/usr/bin/env bash

I3LOCK=$1

get_active_id() {
    xprop -root | awk '$1 ~ /_NET_ACTIVE_WINDOW/ { print $5 }'
}

is_fullscreen() {
    is=$(xprop -id $1 | grep _NET_WM_STATE | grep FULLSCREEN | wc -l)
    return $is
}

should_lock() {
    id=$(get_active_id)

    if is_fullscreen $id; then
        return 0
    else
        return 1
    fi
}

lock() {
    color="f5e0dc"

    ${I3LOCK} -i $HOME/Pictures/Wallpapers/edgerunners_blur.jpg -F --composite \
        -S 0 --force-clock --time-pos="x+960:y+330" --time-color=${color} --date-color=${color} \
        --inside-color=373445ff \
        --ring-color=ffffffff --line-uses-inside \
        --keyhl-color=${color} --bshl-color=d23c3dff --separator-color=00000000 \
        --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
        --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+86:y+1003" \
        --radius=15 --verif-text="" --wrong-text="" --noinput-text=""
}

if should_lock; then
    lock
fi
