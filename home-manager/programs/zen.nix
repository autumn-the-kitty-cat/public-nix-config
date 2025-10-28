{ config, pkgs, ... }:
let
  betterfox = pkgs.fetchFromGitHub {
    owner = "yokoffing";
    repo = "Betterfox";
    rev = "116.1";
    hash = "sha256-Ai8Szbrk/4FhGhS4r5gA2DqjALFRfQKo2a/TwWCIA6g=";
  };

  catppuccinUserChrome = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "zen-browser";
    rev = "0893393f721facb884365a318111c4a7fce96b45";
    hash = "sha256-+Nf7TUairZBnhYCFVBqiQW9QodV/xWSOnH6X9o6S7rM=";
  };
  replaceWithStylixColours =
    textFile:
    with config.stylix.base16Scheme.palette;
    builtins.replaceStrings
      [
        "1e1e2e"
        "181825"
        "313244"
        "45475a"
        "585b70"
        "cdd6f4"
        "f5e0dc"
        "b4befe"
        "f38ba8"
        "fab387"
        "f9e2af"
        "a6e3a1"
        "94e2d5"
        "89b4fa"
        "cba6f7"
        "f2cdcd"
      ]
      [
        base00
        base01
        base02
        base03
        base04
        base05
        base06
        base07
        base08
        base09
        base0A
        base0B
        base0C
        base0D
        base0E
        base0F
      ]
      (builtins.readFile textFile);

  userChromeText = replaceWithStylixColours "${catppuccinUserChrome}/themes/Mocha/Mauve/userChrome.css";
  userContentText = replaceWithStylixColours "${catppuccinUserChrome}/themes/Mocha/Mauve/userContent.css";

in
{
  home.file.".zen/default/chrome/userChrome.css".text = userChromeText;
  home.file.".zen/default/chrome/userContent.css".text = userContentText;
  programs.zen-browser = {
    enable = true;
    policies = {
      DisableTelemtry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      ExtensionSettings = {
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };

        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorBlocker@ajay.app/latest.xpi";
          installation_mode = "force_installed";
        };

        #                    "languagetool-webextension@languagetool.org" = {
        #                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool-webextension@languagetool.org/latest.xpi";
        #                        installation_mode = "force_installed";
        #                    };

        # Return dislikes to YouTube
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{762f9885-5a13-4abd-9c77-433dcd38b8fd}/latest.xpi";
          installation_mode = "force_installed";
        };

        # Catppuccin Mocha Mauve
        "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-mauve-git/latest.xpi";
          installation_mode = "force_installed";
        };

        # Vimium C
        #                    "vimium-c@gdh1995.cn" = {
        #                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c@gdh1995.cn/latest.xpi";
        #                        installation_mode = "force_installed";
        #                    };

        # Dark Reader
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/addon@darkreader.org/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.default = {
      id = 0;
      isDefault = true;
      extraConfig = builtins.concatStringsSep "\n" [
        (builtins.readFile "${betterfox}/Securefox.js")
        (builtins.readFile "${betterfox}/Fastfox.js")
        (builtins.readFile "${betterfox}/Peskyfox.js")
      ];
    };
  };
}
