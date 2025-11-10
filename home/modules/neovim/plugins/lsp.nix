{ pkgs, inputs, ... }:
{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      keymaps = {
        silent = true;

        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename Symbol";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
          };
        };

        diagnostic = {
          "[d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
        };
      };

      # LSP servers
      servers = {
        lua_ls.enable = true;
        pyright.enable = true;
        ts_ls.enable = true;
        nixd.enable = true;
        ruby_lsp.enable = true;
      };
    };

    # conform (auto formatting)
    plugins.conform-nvim = {
      enable = true;

      autoInstall = {
        enable = true;
        enableWarnings = true;
        overrides = { };
      };

      settings = {
        formatters_by_ft = {
          lua = [ "stylua" ];
          python = [ "black" ];
          typescript = [ "prettier" ];
          javascript = [ "prettier" ];
          nix = [ "nixfmt" ];
          sh = [ "shfmt" ];
          ruby = [ "rubocop" ];
          "_" = [ "trim_whitespace" ];
        };

        # auto-format on save
        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 1000;
        };

        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = true;
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
        ruby       = { "rubocop" },
      }
    '';
  };
}
