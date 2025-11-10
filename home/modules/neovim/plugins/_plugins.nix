{pkg, inputs,...}: 
{
  imports = [
    ./noice.nix
    ./snacks.nix
    ./treesitter.nix
    ./lsp.nix
    ./lsp-lines.nix
    ./blink.nix
  ];
}
