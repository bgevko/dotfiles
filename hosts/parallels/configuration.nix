{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;

  networking.hostName = "parallels";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Istanbul";

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "bgevko";
      };
    };
  };

  users.users.bgevko = {
    isNormalUser = true;
    description = "Bogdan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
  programs.fish = {
    enable = true;
  };
  users.defaultUserShell = pkgs.fish;

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zsh
    fish
    kitty
    vim
    wget
    neovim
    git
    ripgrep
    fd
    xclip
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = "25.05";
}
