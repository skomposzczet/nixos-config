{
  inputs,
  outputs,
  ...
}: {
  hardware.pulseaudio.enable = false;
  hardware.graphics.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.acpilight.enable = true;
}
