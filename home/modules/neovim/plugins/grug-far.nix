{ pkgs, ... }: {
  programs.nixvim.plugins = {
    grug-far = {
      enable = true;
      settings = {
        headerMaxWidth = 80;
      };
    };
  };
}
