{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./modules/auth.nix
    ./modules/display/display.nix
    ./modules/neovim/neovim.nix
    ./modules/terminal/terminal.nix
  ];
  home.username = "bgevko";
  home.homeDirectory = "/home/bgevko";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    lazygit
    gh
    age
    _1password-gui
    sops
    yamllint
    tree
    gcc
    trash-cli
    hyprpicker
    brave
  ];

  # programs.qutebrowser = {
  #   enable = true;
  #   extraConfig = ''
  #     c.scrolling.smooth = True
  #     c.auto_save.session = True
  #   '';
  # };

  home.sessionVariables = { };

  programs.home-manager.enable = true;
}
