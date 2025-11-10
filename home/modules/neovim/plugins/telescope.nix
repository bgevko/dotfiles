{ pkgs, ... }: {

  programs.nixvim = {
    plugins = {
      trouble = {
        enable = true;

        settings = {
        use_diagnostic_signs = true;
        };
      };
      telescope = {
        enable = true;

        # Load the fzf-native extension
        enabledExtensions = [ "fzf" ];

        settings = {
          defaults = {
            prompt_prefix = " ";
            selection_caret = " ";
            sorting_strategy = "ascending";
            layout_config = {
              prompt_position = "top";
            };

            mappings = {
              i = {
                "<C-Down>".__raw = "require('telescope.actions').cycle_history_next";
                "<C-Up>".__raw = "require('telescope.actions').cycle_history_prev";
                "<C-f>".__raw = "require('telescope.actions').preview_scrolling_down";
                "<C-b>".__raw = "require('telescope.actions').preview_scrolling_up";
                "<C-t>".__raw = "require('trouble.sources.telescope').open";
                "<A-t>".__raw = "require('trouble.sources.telescope').open";
              };
              n = {
                q.__raw = "require('telescope.actions').close";
              };
            };
          };

          pickers = {
            find_files = {
              hidden = true;
              find_command.__raw = ''
                (function()
                  if vim.fn.executable("rg") == 1 then
                    return { "rg", "--files", "--color", "never", "-g", "!.git" }
                  elseif vim.fn.executable("fd") == 1 then
                    return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
                  elseif vim.fn.executable("fdfind") == 1 then
                    return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
                  elseif vim.fn.executable("find") == 1 and vim.fn.has("win32") == 0 then
                    return { "find", ".", "-type", "f" }
                  elseif vim.fn.executable("where") == 1 then
                    return { "where", "/r", ".", "*" }
                  end
                end)()
              '';
            };
          };
        };

        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fr" = "oldfiles";
          "<leader>fh" = "help_tags";
          "<leader>sd" = "diagnostics";
          "<leader>sk" = "keymaps";
          "<leader>sr" = "resume";
          "<leader>sC" = "commands";
          "<leader>sH" = "highlights";
          "<leader>ss" = "lsp_document_symbols";
          "<leader>sS" = "lsp_dynamic_workspace_symbols";
          "<leader>uC" = "colorscheme";
        };
      };
    };

    # Required for fzf-native extension
    extraPlugins = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
  };
}
