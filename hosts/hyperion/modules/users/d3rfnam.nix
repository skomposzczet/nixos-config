{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  users.users.d3rfnam = {
    isNormalUser = true;
    description = "d3rfnam";
    extraGroups = [ "networkmanager" "wheel" "storage" "media" "video" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
    ];
  };
}
