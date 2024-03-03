{ config, lib, pkgs, ... }:

{
  # Enable Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;  
}
