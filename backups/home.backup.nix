{ config, pkgs, inputs,... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos/config";
in
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  home.username = "bgevko";
  home.homeDirectory = "/home/bgevko";

  home.stateVersion = "25.05"; 

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, F, exec, firefox"
        "$mod, T, exec, kitty"
      ];
      unbind = [
        "SUPER, Q"
      ];
      monitor = [
      "eDP-1,preferred,auto,1"
      ];
    };
  };

  home.packages = with pkgs; [
    lazygit
    gh
  ];

  home.file = {};
  home.sessionVariables = {};

  programs.fish = {
    enable = true;
  };
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./config/starship.toml;
  };
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
    settings = {
      shell = "fish";
      window_padding_width = 10;
      copy_on_select  = "clipboard";
      dynamic_background_opacity = true;
      background_opacity = "0.8";
      background_blur = 10;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
  };
  programs.git = {
    enable = true;
    settings = {
      user.name = "bgevko";
      user.email = "bgevko@gmail.com";
      init.defaultBranch = "main";
      credential.helper = "!gh auth git-credential";
    };
  };
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    opts = {
      clipboard = "unnamedplus";
      smartindent = true;
      autoindent = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      cursorline = true;
      ignorecase = true;
      smartcase = true;
      linebreak = true;
      number = true;
      relativenumber = true;
      ruler = false;
      smoothscroll = true;
      termguicolors = true;
      undofile = true;
      undolevels = 10000;
      wrap = false;
    };
    globals = {
      mapleader = " ";
    };
    plugins = {
      snacks = {
        enable = true;
        settings = {
          explorer.enabled = true;
        };
      };
      copilot-cmp = {
        enable = true;
      };
      copilot-lua = {
        settings = {
          copilot = {
            suggestion.enable = false;
            panel.enable = false;
          };
        };
      };
      cmp = {
        enable = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>lua Snacks.explorer()<cr>";
        options = {
          desc = "Open Snacks File Explorer";
          silent = true;
        };
      }
    ];
  };

  programs.home-manager.enable = true;
}
