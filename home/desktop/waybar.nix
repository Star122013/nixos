{inputs, pkgs, ...} : {
    programs.waybar = {
        enable = true;
        package = inputs.waybar.packages.${pkgs.system}.waybar;
    };
    home.file.".config/waybar" = {
        source = ./config/waybar;
        recursive = true;
  };
}