{lib, pkgs, ...} : {
  services.xserver.displayManager.sessionPackages = with pkgs; [
    hyprland
  ];
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.sddm = { 
      sugarCandyNix = {
        enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
        settings = {
          # Set your configuration options here.
          # Here is a simple example:
          Background = lib.cleanSource ../wallpaper/windows-error.jpg;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
          # ...
        };
      };
    };
}