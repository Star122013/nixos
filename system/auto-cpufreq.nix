# configuration.nix

{inputs, pkgs, ...}: {
    # ---Snip---
    programs.auto-cpufreq.enable = true;
    # optionally, you can configure your auto-cpufreq settings, if you have any
    programs.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
    };

    battery = {
      governor = "powersave";
    };
  };
    # ---Snip---
}