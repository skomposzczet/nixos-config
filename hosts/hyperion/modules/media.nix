{
  inputs,
  outputs,
  ...
}: {
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.opengl.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.acpilight.enable = true;
}
