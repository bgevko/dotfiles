{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      blink-cmp = {
        enable = true;
        setupLspCapabilities = true;

        # Extend Blink’s completion sources
        settings = {
          sources = {
            # Add copilot source definition
            providers = {
              copilot = {
                async = true;
                module = "blink-cmp-copilot";
                name = "copilot";
                score_offset = 100; # Makes Copilot suggestions rank high
              };
            };

            # Include copilot in default sources
            default = [ "lsp" "path" "snippets" "buffer" "copilot" ];
          };

          snippets.preset = "default";
          signature.enabled = true;
          keymap.preset = "enter";
        };
      };

      # Copilot backend
      copilot-lua = {
        enable = true;
        settings = {
          suggestion.enabled = false; # Important — Blink handles completions
          panel.enabled = false;      # Avoids double-popups
          filetypes= {
            "*" = true;  # Enable Copilot for all filetypes
          };
        };
      };

      # Copilot integration for Blink
      blink-cmp-copilot.enable = true;
    };
  };
}
