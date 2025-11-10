{
  description = "autumn's NixOS & home-manager Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-wallpaper = {
      url = "github:lunik1/nix-wallpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations."nixos" = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        inherit pkgs;
        modules = [
          ./nixos/configuration.nix

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "hm-bak";

            home-manager.extraSpecialArgs = { inherit inputs; };

            home-manager.sharedModules = [
              inputs.nixvim.homeModules.nixvim
              inputs.stylix.homeModules.stylix
              inputs.zen-browser.homeModules.default
            ];

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users."autumn" = ./home-manager/home.nix;
          }
        ];
      };
    };
}
