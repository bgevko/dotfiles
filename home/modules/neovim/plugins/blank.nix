{pkg, inputs,...}: 
{
  programs.nixvim.plugins = {
    flash = {
      enable = true;
    };
  };
}
