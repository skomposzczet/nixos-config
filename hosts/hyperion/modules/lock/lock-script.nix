{ pkgs }:

pkgs.writeShellApplication {
  name = "nix-i3-lock";

  runtimeInputs = [ pkgs.i3lock-color ];

  text = /* bash */ ''
    color="f5e0dc";
    i3lock-color -i "$HOME"/.config/wallpaper/wallpaper_blur.png -F --composite \
        -S 0 --force-clock --time-pos="x+960:y+330" --time-color="$color" --date-color="$color" \
        --inside-color=373445ff \
        --ring-color=ffffffff --line-uses-inside \
        --keyhl-color="$color" --bshl-color=d23c3dff --separator-color=00000000 \
        --insidever-color=fecf4dff --insidewrong-color=d23c3dff \
        --ringver-color=ffffffff --ringwrong-color=ffffffff --ind-pos="x+86:y+1003" \
        --radius=15 --verif-text="" --wrong-text="" --noinput-text=""
  '';
}
