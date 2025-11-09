{pkg, inputs,...}: 
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
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
}
