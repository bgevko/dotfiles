{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./auto_cmds.nix
    ./opts.nix
    ./keymaps.nix
    ./plugins/_plugins.nix
  ];
  # comment
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPlugins = with pkgs.vimPlugins; [
      dracula-nvim
    ];
    colorscheme = "dracula";
    extraConfigLuaPost = ''
      vim.api.nvim_set_hl(0, "Comment", { fg = "#abb5d4", italic = true })
      -- vim.api.nvim_set_hl(0, "Comment", { fg = "#ff79c6", italic = true })
    '';
    plugins = {
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
  };
}
