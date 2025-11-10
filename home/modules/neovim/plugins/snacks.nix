{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      snacks-nvim
    ];

    extraConfigLuaPost = ''
      require("snacks").setup({
        bigfile   = { enabled = true },
        explorer  = { enabled = true, replace_netrw = true },
      })
    '';
  };
}
