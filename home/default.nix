{config, lib, pkgs, ... }:

{
  imports = [
    ./chromium
    ./packages
    ./desktop
    ./editor
    ./terminal
  ];

  # 注意修改这里的用户名与用户目录
  home.username = "hyy";
  home.homeDirectory = lib.mkDefault "/home/hyy";

  

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
