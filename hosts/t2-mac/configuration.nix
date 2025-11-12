{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  time.timeZone = "Europe/Istanbul";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation (final: {
      name = "brcm-firmware";
      src = ./firmware/brcm;
      installPhase = ''
        mkdir -p $out/lib/firmware/brcm
        cp ${final.src}/* "$out/lib/firmware/brcm"
      '';
    }))
  ];
  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;
  services.blueman.enable = true;
  # systemd.user.services.bluetooth-scan = {
  #   description = "Bluetooth scan/connect on login";
  #   wantedBy = [ "default.target" ];
  #   after = [
  #     "bluetooth.target"
  #     "bluetooth.service"
  #   ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.bluez}/bin/bluetoothctl scan on";
  #   };
  # };

  networking.hostName = "t2-mac";
  networking.networkmanager.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # temporary
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
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
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      tree
    ];
  };
  programs.fish = {
    enable = true;
  };
  users.defaultUserShell = pkgs.fish;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    networkmanager
    bluetuith
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
    qutebrowser
    overskride
    waybar
    hyprpaper
    brave
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.11";

}
