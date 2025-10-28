{
  description = "Home Manager configuration of autumn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #catppuccin.url = "github:catppuccin/nix";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-wallpaper.url = "github:lunik1/nix-wallpaper";
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      spicetify-nix,
      stylix,
      zen-browser,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."autumn" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          inputs.nixvim.homeModules.nixvim
          #inputs.catppuccin.homeManagerModules.catppuccin
          inputs.spicetify-nix.homeManagerModules.default
          inputs.stylix.homeModules.stylix
          inputs.zen-browser.homeModules.default
          inputs.mango.hmModules.mango
        ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
}
