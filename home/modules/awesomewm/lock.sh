#!/usr/bin/env bash

I3LOCK=$1

lock() {
    color="f5e0dc"

    ${I3LOCK} -i $HOME/.config/wallpaper/wallpaper_blur.png -F --composite \
        -S 0 --force-clock --time-pos="x+960:y+330" --time-color=${color} --date-color=${color} \
        --inside-color=373445ff \
        --ring-color=ffffffff --line-uses-inside \
        --keyhl-color=${color} --bshl-color=d23c3dff --separator-color=00000000 \
        --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
        --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+86:y+1003" \
        --radius=15 --verif-text="" --wrong-text="" --noinput-text=""
}

lock
