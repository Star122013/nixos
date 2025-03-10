{ config, ... }:
let
  font_family = "Maple Mono SC NF";
in
{
  programs.hyprlock = {
    enable = true;

    sources = [
      "~/.config/hypr/mocha.conf"
    ];

    general = {
      disable_loading_bar = true;
      hide_cursor = false;
      no_fade_in = true;
    };

    backgrounds = [
      {
        monitor = "";
        path = "${config.machine.wallpaper}"; # Only png supported

        blur_size = 4;
        blur_passes = 3; # 0 disables blur
        noise = 0.0117;
        contrast = 1.3000; # Vibrant!!!
        brightness = 0.8000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      }
    ];

    input-fields = [
      {
        monitor = "DP-1";
        size = {
          width = 250;
          height = 50;
        };

        outline_thickness = 3;
        outer_color = "$base";
        inner_color = "$base";
        font_color = "$text";
        fade_on_empty = true;
        placeholder_text = "<i>Password...</i>"; # Text rendered in the input box when it's empty
        dots_size = 0.26; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        hide_input = false;

        position = {
          x = 0;
          y = 60;
        };
        halign = "center";
        valign = "bottom";
      }
    ];

    labels = [
      # Current time
      {
        monitor = "";
        text = "cmd[update:1000] echo \"<b><big> $(date +\"%H:%M:%S\")</big></b>\"";
        inherit font_family;
        font_size = 64;
        color = "$text";
        shadow_passes = 3;
        shadow_size = 4;

        position = {
          x = 0;
          y = 60;
        };

        valign = "center";
        halign = "center";
      }

      # Date
      {
        monitor = "";
        text = "cmd[update:18000000] echo \"<b> $(date +\"%A, %-d %B %Y\")</b>\"";
        inherit font_family;
        font_size = 24;
        color = "$overlay0";
        position = {
          x = 0;
          y = 0;
        };
        valign = "center";
        halign = "center";

      }

      # User
      {
        monitor = "";
        text = "Hey $USER";
        font_family = "Roboto";
        font_size = 18;
        color = "$overlay0";
        position = {
          x = 0;
          y = 20;
        };
        valign = "bottom";
        halign = "center";
      }
    ];
  };
}