{
pkgs,
...
}: {
    programs.rofi = {
        enable = true;
        plugins = [ 
            pkgs.rofi-calc
            pkgs.rofi-file-browser
        ];
        pass.enable = true;
    };
    home.file.".config/rofi/clr/catppuccin.rasi".source = ./rofi/clr/catppuccin.rasi;

    home.file.".config/rofi/img/cowboy.png".source = ./rofi/img/cowboy.png;
    home.file.".config/rofi/elated.rasi".source = ./rofi/elated.rasi;

    home.file.".config/rofi/img/sonoshee.png".source = ./rofi/img/sonoshee.png;
    home.file.".config/rofi/balanced.rasi".source = ./rofi/balanced.rasi;

    home.file.".config/rofi/img/rel.png".source = ./rofi/img/rel.png;
    home.file.".config/rofi/modest.rasi".source = ./rofi/modest.rasi;

    home.file.".config/rofi/img/am.jpg".source = ./rofi/img/am.jpg;
    home.file.".config/rofi/generic.rasi".source = ./rofi/generic.rasi;

    home.file.".config/rofi/calc.rasi".source = ./rofi/calc.rasi;
}
