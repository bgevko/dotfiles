{ pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, F, exec, firefox"
        "$mod, T, exec, kitty"
      ];
      unbind = [
        "SUPER, Q"
      ];
      monitor = [
      ",1728x1117,auto,1"
      ];
    };
  };
}
