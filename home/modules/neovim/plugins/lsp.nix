{ pkgs, inputs, ... }: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        lua_ls.enable = true;
        pyright.enable = true;
        ts_ls.enable = true;
        nixd.enable = true;
      };
    };

    # Add nvim-lint
    extraPlugins = [
      pkgs.vimPlugins.nvim-lint
    ];

    extraConfigLua = ''
      local lint = require("lint")

      -- Define linters per filetype
      lint.linters_by_ft = {
        lua        = { "selene" },
        python     = { "flake8" },
        typescript = { "eslint_d" },
        javascript = { "eslint_d" },
        nix        = { "statix" },
        sh         = { "shellcheck" },
      }
    '';
  };
}
