{pkg, inputs,...}: 
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./auto_cmds.nix
    ./opts.nix
    ./keymaps.nix
    ./plugins/_plugins.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
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
