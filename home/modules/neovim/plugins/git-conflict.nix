{pkgs, inputs,...}: 
{
  programs.nixvim.plugins = {
    git-conflict = {
      enable = true;
    };
  };
}
