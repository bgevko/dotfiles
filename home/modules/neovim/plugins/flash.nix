{pkg, inputs,...}: 
{
  programs.nixvim.plugins = {
    flash = {
      enable = true;

      settings = {
        search.multi_window = true;
        label.uppercase = true;
        jump.autojump = false;
      };
    };
  };
}
