{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "skomposzczet";
    userEmail = "72391558+skomposzczet@users.noreply.github.com";

    signing = {
      key = "73E2CB88A0B6EE2BC82EEFABF4061BBD70A3A446";
      signByDefault = true;
    };
  };
}
