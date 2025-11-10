{
  inputs,
  pkgs,
  ...
}:
{
  stylix =
    let
      palette = {
        base00 = "11111a"; # 11111a
        base01 = "181825"; # 181825
        base02 = "313244"; # 313244
        base03 = "45475a"; # 45475a
        base04 = "585b70"; # 585b70
        base05 = "cdd6f4"; # cdd6f4
        base06 = "f5e0dc"; # f5e0dc
        base07 = "b4befe"; # b4befe
        base08 = "f38ba8"; # f38ba8
        base09 = "fab387"; # fab387
        base0A = "f9e2af"; # f9e2af
        base0B = "a6e3a1"; # a6e3a1
        base0C = "94e2d5"; # 94e2d5
        base0D = "89b4fa"; # 89b4fa
        base0E = "cba6f7"; # cba6f7
        base0F = "f2cdcd"; # f2cdcd

        #base00 = "1d2021"; #1d2021
        #base01 = "3c3836"; #3c3836
        #base02 = "504945"; #504945
        #base03 = "665c54"; #665c54
        #base04 = "bdae93"; #bdae93
        #base05 = "d5c4a1"; #d5c4a1
        #base06 = "ebdbb2"; #ebdbb2
        #base07 = "fbf1c7"; #fbf1c7
        #base08 = "fb4934"; #fb4934
        #base09 = "fe8019"; #fe8019
        #base0A = "fabd2f"; #fabd2f
        #base0B = "b8bb26"; #b8bb26
        #base0C = "8ec07c"; #8ec07c
        #base0D = "83a598"; #83a598
        #base0E = "d3869b"; #d3869b
        #base0F = "d65d0e"; #d65d0e
      };
      wallpaper = inputs.nix-wallpaper.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
        width = 2560;
        height = 1440;
        backgroundColor = "#${palette.base00}";
        logoColors = {
          color0 = "#${palette.base0D}";
          color1 = "#${palette.base0D}";
          color2 = "#${palette.base0D}";
          color3 = "#${palette.base0D}";
          color4 = "#${palette.base0D}";
          color5 = "#${palette.base0D}";
        };
      };
    in

    {
      enable = true;
      image = "${wallpaper}/share/wallpapers/nixos-wallpaper.png";
      polarity = "dark";
      targets.waybar.enable = false;
      targets.zathura.enable = false;
      targets.vesktop.enable = false;
      targets.zen-browser.enable = false;
      fonts =
        let
          font = {
            package = pkgs.nerd-fonts.caskaydia-cove;
            name = "CaskaydiaCove Nerd Font";
          };
        in
        {
          monospace = font;
          serif = font;
          sansSerif = font;
          emoji = font;
        };
      base16Scheme.palette = palette;
    };
}
