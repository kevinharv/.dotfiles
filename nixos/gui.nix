{ config, lib, pkgs, ... }:

{
  # Enable X11, i3, GDM
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    displayManager.gdm.enable = true;
  };  

  # Enable Pipewire for sound
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  # Configure Redshift
  location.provider = "manual";
  location.latitude = 32.8;
  location.longitude = -96.8;
  services.redshift = {
    enable = true;
    brightness = {
      day = "1";
      night = "1";
    };
    temperature = {
      day = 3800;
      night = 3800;
    };
  };
}
