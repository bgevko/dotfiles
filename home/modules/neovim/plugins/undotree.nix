{pkg, inputs,...}: 
{
  programs.nixvim.plugins = {
    undotree = {
      enable = true;
    };
  };
}
