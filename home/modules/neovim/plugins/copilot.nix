{ pkgs, inputs, ... }:
{
  programs.nixvim.plugins = {
    copilot-lua = {
      enable = true;

      # Inline ghost text suggestions only
      settings = {
        panel = {
          enabled = false;  # disable Copilot side panel entirely
        };

        suggestion = {
          enabled = true;         # enable ghost inline suggestions
          auto_trigger = true;    # trigger automatically while typing
          hide_during_completion = true;  # hide while LSP popup is active
          debounce = 75;

          keymap = {
            accept = "<M-l>";      # accept full suggestion
            accept_word = false;   # disable partial accept
            accept_line = false;
            next = "<M-]>";
            prev = "<M-[>";
            dismiss = "<C-]>";
          };
        };

        # make sure it's not active in places like git commits or help
        filetypes = {
          gitcommit = false;
          help = false;
          "." = false;
        };

        copilot_node_command = "node";  # use system node (v20+ required)
      };
    };
  };
}
