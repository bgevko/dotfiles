{pkg, inputs,...}: 
{
  programs.nixvim.plugins = {
    noice = {
      enable = true;
    };
  };
}
