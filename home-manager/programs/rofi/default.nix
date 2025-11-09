{ pkgs, ... }:
{
  imports = [
    ./config.nix
    ./theme.nix
  ];

  home.packages = [
    pkgs.rofi-power-menu
    pkgs.rofi
  ];
}
