{ pkgs, inputs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    folding = true;
    nixGrammars = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      diff
      html
      javascript
      jsdoc
      json
      jsonc
      lua
      markdown
      markdown_inline
      printf
      python
      query
      regex
      toml
      tsx
      typescript
      vim
      vimdoc
      xml
      yaml
      css
      scss
      nix
      hyprlang
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
      ensure_installed = [
        "bash"
        "c"
        "diff"
        "html"
        "javascript"
        "jsdoc"
        "json"
        "jsonc"
        "lua"
        "luadoc"
        "luap"
        "markdown"
        "markdown_inline"
        "printf"
        "python"
        "query"
        "regex"
        "toml"
        "tsx"
        "typescript"
        "vim"
        "vimdoc"
        "xml"
        "yaml"
        "css"
        "scss"
        "nix"
        "hyprlang"
      ];
    };
  };
}
