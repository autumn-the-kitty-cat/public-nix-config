{ pkgs, ... }:
{
  imports = [
    ./programs

    ./clangd.nix
    ./hyprland.nix
    ./packages.nix
    ./stylix.nix
    ./xdg.nix
  ];

  home.username = "autumn";
  home.homeDirectory = "/home/autumn";
  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 12;
  };

  programs.home-manager.enable = true;
}
