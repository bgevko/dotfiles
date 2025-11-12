{ pkgs, osConfig, ... }:
{
  programs.fish.shellAbbrs = {
    v = "nvim";
    picker = "hyprpicker";
    rebuild = "git add . && sudo nixos-rebuild switch --flake /home/bgevko/nixos#${osConfig.networking.hostName}";
    conf = "vi /home/bgevko/nixos/hosts/${osConfig.networking.hostName}/configuration.nix";
    hconf = "vi /home/bgevko/nixos/hosts/${osConfig.networking.hostName}/hardware-configuration.nix";
    nixos = "cd /home/bgevko/nixos";
    hm = "vi /home/bgevko/nixos/home/bgevko.nix";
    term = "vi /home/bgevko/nixos/home/modules/terminal/terminal.nix";
    disp = "vi /home/bgevko/nixos/home/modules/display/display.nix";
    hypr = "vi /home/bgevko/nixos/configs/hypr/hyprland.conf";
    way = "vi /home/bgevko/nixos/configs/waybar/style.css";
    aliases = "vi /home/bgevko/nixos/home/modules/terminal/aliases.nix";
    n = "vi /home/bgevko/nixos/home/modules/neovim/neovim.nix";
    nplug = "vi /home/bgevko/nixos/home/modules/neovim/plugins/_plugins.nix";
    nlsp = "vi /home/bgevko/nixos/home/modules/neovim/plugins/lsp.nix";
    ntree = "vi /home/bgevko/nixos/home/modules/neovim/plugins/treesitter.nix";
    nkeys = "vi /home/bgevko/nixos/home/modules/neovim/keymaps.nix";
    ncmds = "vi /home/bgevko/nixos/home/modules/neovim/auto_cmds.nix";
    nopts = "vi /home/bgevko/nixos/home/modules/neovim/opts.nix";
  };
}
