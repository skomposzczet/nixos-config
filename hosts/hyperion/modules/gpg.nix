{
  inputs,
  outputs,
  ...
}: {
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
}
