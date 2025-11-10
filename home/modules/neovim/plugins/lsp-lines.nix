{pkgs, inputs,...}: 
{
  programs.nixvim = {
    plugins = {
      lsp-lines = {
        enable = true;
      };
    };
    extraConfigLuaPost = ''
      -- Enable Neovim’s default inline virtual text diagnostics
      vim.diagnostic.config({
        virtual_text = true,
      })
    '';
  };
}
