{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    elephant.url = "github:abenz1267/elephant";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in
  {
    nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.aman = import ./home.nix;
            extraSpecialArgs = { inherit inputs; };
            backupFileExtension = "bak";
          };
        }
      ];
    };
  };
}
