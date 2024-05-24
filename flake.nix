{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    waybar.url = "github:Alexays/Waybar"; # Fix broken waybar on current nixpkgs-unstable
    ags.url = "github:Aylur/ags";
    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    sddm-sugar-candy-nix.url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
  };
  outputs = { self, nixpkgs, home-manager, ags, waybar,... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system
        ./proxy
        ./fonts
        inputs.sddm-sugar-candy-nix.nixosModules.default
        {
          _module.args = { inherit inputs; };
        }
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.hyy = import ./home;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
      ];
    };
  };
}