{ pkg, inputs, lib, ... }:
{
  programs.nixvim.plugins = {
    noice = {
      enable = true;
      settings = {
        lsp = {
          override = {
            # Enable Treesitter-enhanced markdown rendering for LSP docs
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };

        # Presets matching LazyVim defaults
        presets = {
          bottom_search = true;          # classic bottom cmdline for search
          command_palette = true;        # cmdline & popupmenu together
          long_message_to_split = true;  # long messages go to split
          inc_rename = false;            # disable inc-rename dialog
          lsp_doc_border = false;        # disable hover/signature borders
        };
      };
    };

    # Required dependencies for Noice
    nui.enable = true;
    notify.enable = true;
  };
}
