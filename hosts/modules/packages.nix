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
    ntfs3g

    # gpg
    gnupg
  ];
}
