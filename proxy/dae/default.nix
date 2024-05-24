{config, lib, pkgs, ...} : {
  services.dae = {
    enable = true;
    configFile = ./config.dae;
  };
}