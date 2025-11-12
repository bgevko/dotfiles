{ pkgs, inputs, ... }:
{
  programs.nixvim.plugins = {
    colorizer = {
      enable = true;
    };
  };
}
