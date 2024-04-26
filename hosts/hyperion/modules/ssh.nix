{
  inputs,
  outputs,
  ...
}: {
  services.openssh.enable = true;
  programs.ssh.enableAskPassword = false;
}
