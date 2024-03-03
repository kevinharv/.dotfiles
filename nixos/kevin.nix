{ config, lib, pkgs, ... }:

{
  # Configure kevin user
  users.users.kevin = {
    isNormalUser = true;
    extraGroups = [ "libvirtd" "docker" "wheel" ];
    packages = with pkgs; [
      # Editors
      vim
      neovim

      # Core Utilities
      coreutils
      wget
      git
      gnutar
      zip
      curl
      openssh
      stow
      killall

      # GUI/DE
      rofi
      feh
      picom
      redshift
      pulseaudio
      playerctl
      polybar
      xss-lock
      i3lock

      # Development
      gnumake
      gcc
      python3
      gccgo13

      # User Apps
      alacritty
      firefox
      spotify
      ansible
      vlc
      htop
      vagrant
      tree
      libreoffice-qt 
    ];
  };
}
