#
# /etc/nixos/configuration.nix
# configuration.nix(5) or nixos-help or https://search.nixos.org/options
#

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "europa";
  networking.wireless.enable = true;

  programs.sway.enable = true;
  programs.zsh.enable = true;

  #hardware.pulseaudio.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # podman
  # from https://nixos.wiki/wiki/Podman
  virtualisation = {
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users.al = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = "/run/current-system/sw/bin/zsh";
    packages = with pkgs; [
      firefox
      git
      tmux
      alacritty
      jq
      dunst
      syncthing
      i3status
      noto-fonts-color-emoji
      terminus-nerdfont
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  # NO TOUCHING.
  # See `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11";

}
