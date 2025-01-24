{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    xclip
    file
    pavucontrol
    alsa-utils
    ntfs3g

    # gpg
    gnupg
  ];
}
