{
  config,
  pkgs,
  osConfig,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos/configs";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    waybar = "waybar";
  };
in
{
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
}
# { pkgs, ... }:
# {
#   wayland.windowManager.hyprland = {
#     enable = true;
#     settings = {
#       "$mod" = "alt";
#       bind = [
#         "SUPER, F, exec, firefox"
#         "SUPER, T, exec, kitty"
#         "$mod, l, movefocus, l"
#         "$mod, h, movefocus, r"
#         "$mod, j, movefocus, d"
#         "$mod, k, movefocus, u"
#         "$mod, Q, killactive"
#       ];
#       # unbind = [
#       #   "SUPER, Q"
#       # ];
#       monitor = [
#         ",1728x1117,auto,1"
#         # ",1920x1080,auto,1"
#       ];
#     };
#   };
# }
