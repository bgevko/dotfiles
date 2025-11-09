{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      cd ~/nixos
    '';
  };
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
  programs.kitty = {
    enable = true;
    themeFile = "Dracula";
    settings = {
      shell = "fish";
      window_padding_width = 10;
      copy_on_select  = "clipboard";
      dynamic_background_opacity = true;
      background_opacity = "0.8";
      background_blur = 10;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
  };
}
