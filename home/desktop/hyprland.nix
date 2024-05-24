{inputs, pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd.enable = true;
    extraConfig  = builtins.readFile ./config/hypr/base.conf;
  };
  home.file.".config/hypr" = {
    source = ./config/hypr;
    recursive = true;
  };
  home.packages = with pkgs;[
    swww
  ];
}