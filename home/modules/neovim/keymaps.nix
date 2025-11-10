{pkg, inputs,...}: 
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
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
      {
        mode = [
          "n"
          "x"
        ];
        key = "j";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<Down>";
        action = "v:count == 0 ? 'gj' : 'j'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "k";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<Up>";
        action = "v:count == 0 ? 'gk' : 'k'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = "x";
        key = "<";
        action = "<gv";
      }
      {
        mode = "x";
        key = ">";
        action = ">gv";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Go to Left Window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Go to Lower Window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Go to Upper Window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Go to Right Window";
          remap = true;
        };
      }
      {
        mode = "i";
        key = ",";
        action = ",<c-g>u";
      }
      {
        mode = "i";
        key = ".";
        action = ".<c-g>u";
      }
      {
        mode = "i";
        key = ";";
        action = ";<c-g>u";
      }
      {
        mode = [
          "i"
          "x"
          "n"
          "s"
        ];
        key = "<C-s>";
        action = "<cmd>w<cr><esc>";
        options = {
          desc = "Save File";
        };
      }
      {
        mode = [
          "i"
          "n"
        ];
        key = "<esc>";
        action = "<cmd>noh<cr><esc>";
        options = {
          desc = "Escape and Clear hlsearch";
        };
      }
      {
        mode = "n";
        key = "n";
        action = "'Nn'[v:searchforward].'zv'";
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        mode = "x";
        key = "n";
        action = "'Nn'[v:searchforward]";
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        mode = "o";
        key = "n";
        action = "'Nn'[v:searchforward]";
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        mode = "n";
        key = "N";
        action = "'nN'[v:searchforward].'zv'";
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }
      {
        mode = "x";
        key = "N";
        action = "'nN'[v:searchforward]";
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }
      {
        mode = "o";
        key = "N";
        action = "'nN'[v:searchforward]";
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }
      {
        mode = "n";
        key = "<leader>cd";
        action = "vim.diagnostic.open_float";
        options = {
          desc = "Line Diagnostics";
        };
      }
      {
        mode = "n";
        key = "]d";
        action = "diagnostic_goto(true)";
        options = {
          desc = "Next Diagnostic";
        };
      }
      {
        mode = "n";
        key = "[d";
        action = "diagnostic_goto(false)";
        options = {
          desc = "Prev Diagnostic";
        };
      }
      {
        mode = "n";
        key = "]e";
        action = "diagnostic_goto(true 'ERROR')";
        options = {
          desc = "Next Error";
        };
      }
      {
        mode = "n";
        key = "[e";
        action = "diagnostic_goto(false 'ERROR')";
        options = {
          desc = "Prev Error";
        };
      }
      {
        mode = "n";
        key = "]w";
        action = "diagnostic_goto(true 'WARN')";
        options = {
          desc = "Next Warning";
        };
      }
      {
        mode = "n";
        key = "[w";
        action = "diagnostic_goto(false 'WARN')";
        options = {
          desc = "Prev Warning";
        };
      }
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>qa<cr>";
        options = {
          desc = "Quit All";
        };
      }
      {
        mode = "t";
        key = "<esc><esc>";
        action = "<c-\\><c-n>";
        options = {
          desc = "Enter Normal Mode";
        };
      }
      {
        mode = "i";
        key = "jk";
        action = "<Esc>";
        options = {
          noremap = true;
          silent = true;
          desc = "jk to exit insert mode";
        };
      }
      {
        mode = "i";
        key = "JK";
        action = "<Esc>";
        options = {
          noremap = true;
          silent = true;
          desc = "JK to exit insert mode";
        };
      }
      {
        mode = "v";
        key = "jk";
        action = "<Esc>";
        options = {
          noremap = true;
          silent = true;
          desc = "jk to exit visual mode";
        };
      }

      # Paste without yanking
      {
        mode = "v";
        key = "p";
        action = "\"_dP";
        options = {
          desc = "Paste without yanking";
        };
      }

      # Delete/change without yanking
      {
        mode = "n";
        key = "dd";
        action = "\"_dd";
        options = {
          desc = "Delete line without yanking";
        };
      }
      {
        mode = "n";
        key = "d";
        action = "\"_d";
        options = {
          desc = "Delete without yanking";
        };
      }
      {
        mode = "v";
        key = "d";
        action = "\"_d";
        options = {
          desc = "Delete without yanking";
        };
      }
      {
        mode = "n";
        key = "D";
        action = "\"_D";
        options = {
          desc = "Delete to end of line without yanking";
        };
      }
      {
        mode = "n";
        key = "c";
        action = "\"_c";
        options = {
          desc = "Change without yanking";
        };
      }
      {
        mode = "n";
        key = "cc";
        action = "\"_cc";
        options = {
          desc = "Change line without yanking";
        };
      }

      # Move selection up/down with capital K/J
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          desc = "Move selection up";
        };
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          desc = "Move selection down";
        };
      }

      # Join lines with cursor position preserved
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
        options = {
          desc = "Join lines (keep cursor position)";
        };
      }

      # Search & Replace word under cursor
      {
        mode = "n";
        key = "<leader>r";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
        options = {
          desc = "Replace word under cursor";
        };
      }
      {
        mode = "n";
        key = "<leader>;";
        action = ":!./local.sh<CR>";
        options = {
          desc = "Run local script 'local.sh'";
        };
      }
      {
        mode = "n";
        key = "<leader>m";
        action = "<cmd>lua Snacks.dashboard()<cr>";
        options = {
          desc = "Open dashboard";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>e #<cr>";
        options = { desc = "Switch to Other Buffer"; };
      }
      {
        mode = "n";
        key = "<leader>`";
        action = "<cmd>e #<cr>";
        options = { desc = "Switch to Other Buffer"; };
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>lua Snacks.bufdelete()<cr>";
        options = { desc = "Delete Buffer"; };
      }
      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>lua Snacks.bufdelete.other()<cr>";
        options = { desc = "Delete Other Buffers"; };
      }
      {
        mode = "n";
        key = "gco";
        action = "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
        options = {
          desc = "Add Comment Below";
        };
      }
      {
        mode = "n";
        key = "gcO";
        action = "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
        options = {
          desc = "Add Comment Above";
        };
      }
      {
        key = "<leader>s";
        action.__raw = "require('flash').jump";
        mode = "n";
        options.desc = "Flash Search";
      }
      {
        key = "<leader>sr";
        mode = [ "n" "x" ];
        options.desc = "Search and Replace";
        action.__raw = ''
          function()
            local grug = require("grug-far")
            local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
            grug.open({
              transient = true,
              prefills = {
                filesFilter = ext and ext ~= "" and "*." .. ext or nil,
              },
            })
          end
        '';
      }
      {
        key = "<leader>U";
        mode = "n";
        action = "<cmd>UndotreeToggle<cr>";
        options.desc = "Toggle undo tree";
      }
    ];
  };
}
