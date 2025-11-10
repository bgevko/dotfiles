{ pkg, inputs, ... }:
{
  programs.nixvim = {
    autoGroups = {
      highlight_yank = { };
      indentscope = { };
      restore_cursor = { };
      checktime = { };
      resize_splits = { };
      last_loc = { };
      close_with_q = { };
      man_unlisted = { };
      wrap_spell = { };
      json_conceal = { };
      auto_create_dir = { };
      treesitter_notify = { };
    };

    autoCmd = [
      # ──────────────────────────────────────────────────────────────
      # Highlight on yank
      # ──────────────────────────────────────────────────────────────
      {
        group = "highlight_yank";
        event = [ "TextYankPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              (vim.hl or vim.highlight).on_yank()
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Disable indentscope for certain filetypes
      # ──────────────────────────────────────────────────────────────
      {
        group = "indentscope";
        event = [ "FileType" ];
        pattern = [
          "help"
          "Startup"
          "startup"
          "neo-tree"
          "Trouble"
          "trouble"
          "notify"
        ];
        callback = {
          __raw = ''
            function()
              vim.b.miniindentscope_disable = true
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Restore cursor to last position (NVChad/LazyVim-style)
      # ──────────────────────────────────────────────────────────────
      {
        group = "restore_cursor";
        event = [ "BufReadPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              local exclude = { "gitcommit" }
              local buf = vim.api.nvim_get_current_buf()
              if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
                return
              end
              vim.b[buf].lazyvim_last_loc = true
              local mark = vim.api.nvim_buf_get_mark(buf, '"')
              local lcount = vim.api.nvim_buf_line_count(buf)
              if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
              end
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Checktime – reload files changed outside of Neovim
      # ──────────────────────────────────────────────────────────────
      {
        group = "checktime";
        event = [ "FocusGained" "TermClose" "TermLeave" ];
        callback = {
          __raw = ''
            function()
              if vim.o.buftype ~= "nofile" then
                vim.cmd("checktime")
              end
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Resize splits evenly when window is resized
      # ──────────────────────────────────────────────────────────────
      {
        group = "resize_splits";
        event = [ "VimResized" ];
        callback = {
          __raw = ''
            function()
              local current_tab = vim.fn.tabpagenr()
              vim.cmd("tabdo wincmd =")
              vim.cmd("tabnext " .. current_tab)
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Close certain filetypes with 'q'
      # ──────────────────────────────────────────────────────────────
      {
        group = "close_with_q";
        event = [ "FileType" ];
        pattern = [
          "PlenaryTestPopup"
          "checkhealth"
          "dbout"
          "gitsigns-blame"
          "grug-far"
          "help"
          "lspinfo"
          "neotest-output"
          "neotest-output-panel"
          "neotest-summary"
          "notify"
          "qf"
          "spectre_panel"
          "startuptime"
          "tsplayground"
        ];
        callback = {
          __raw = ''
            function(event)
              vim.bo[event.buf].buflisted = false
              vim.schedule(function()
                vim.keymap.set("n", "q", function()
                  vim.cmd("close")
                  pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
                end, { buffer = event.buf, silent = true, desc = "Quit buffer" })
              end)
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Make man pages unlisted
      # ──────────────────────────────────────────────────────────────
      {
        group = "man_unlisted";
        event = [ "FileType" ];
        pattern = [ "man" ];
        callback = {
          __raw = ''
            function(event)
              vim.bo[event.buf].buflisted = false
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Enable wrap + spell checking in text filetypes
      # ──────────────────────────────────────────────────────────────
      {
        group = "wrap_spell";
        event = [ "FileType" ];
        pattern = [ "text" "plaintex" "typst" "gitcommit" "markdown" ];
        callback = {
          __raw = ''
            function()
              vim.opt_local.wrap = true
              vim.opt_local.spell = true
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Disable conceal in JSON-like filetypes
      # ──────────────────────────────────────────────────────────────
      {
        group = "json_conceal";
        event = [ "FileType" ];
        pattern = [ "json" "jsonc" "json5" ];
        callback = {
          __raw = ''
            function()
              vim.opt_local.conceallevel = 0
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Auto-create directories when saving
      # ──────────────────────────────────────────────────────────────
      {
        group = "auto_create_dir";
        event = [ "BufWritePre" ];
        callback = {
          __raw = ''
            function(event)
              if event.match:match("^%w%w+:[\\/][\\/]") then
                return
              end
              local file = vim.uv.fs_realpath(event.match) or event.match
              vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
            end
          '';
        };
      }

      # ──────────────────────────────────────────────────────────────
      # Notify when treesitter parser isn't installed
      # ──────────────────────────────────────────────────────────────
      {
        group = "treesitter_notify";
        event = [ "FileType" ];
        pattern = "*";
        callback = {
          __raw = ''
            function(event)
              local buf = event.buf
              -- only check normal, listed file buffers (skip nofile/help/quickfix/notify/etc)
              if vim.bo[buf].buftype ~= "" or vim.bo[buf].buflisted == false then
                return
              end
              -- avoid repeating per buffer
              if vim.b[buf]._ts_missing_checked then
                return
              end
              vim.b[buf]._ts_missing_checked = true

              local ft = vim.bo[buf].filetype
              if not ft or ft == "" then return end

              local has = false
              local ok_parsers, parsers = pcall(require, "nvim-treesitter.parsers")
              if ok_parsers then
                local lang = parsers.ft_to_lang(ft)
                has = parsers.has_parser(lang)
              else
                local lang = (vim.treesitter.language.get_lang and vim.treesitter.language.get_lang(ft)) or ft
                has = pcall(vim.treesitter.get_parser, buf, lang)
              end

              if not has then
                vim.schedule(function()
                  vim.notify("No Tree-sitter parser for filetype: " .. ft, vim.log.levels.WARN, { title = "Tree-sitter" })
                end)
              end
            end
          '';
        };
      }
    ];
  };
}
