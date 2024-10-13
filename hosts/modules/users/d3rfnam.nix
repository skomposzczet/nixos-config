{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  users.groups.media = {};
  users.groups.libvirt = {};

  users.users.d3rfnam = {
    isNormalUser = true;
    description = "d3rfnam";
    extraGroups = [ "networkmanager" "wheel" "storage" "media" "video" "docker" "libvirt" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
    ];
  };
}
