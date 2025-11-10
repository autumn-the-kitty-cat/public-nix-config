{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;

  networking.hostName = "nixos";

  hardware.graphics.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_CA.UTF-8";

  services.udev.extraRules = ''
      	SUBSYSTEMS=="usb", ATTR{idVendor}=="*", MODE:="0666"
    	KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  services.gnome.glib-networking.enable = true;

  programs.hyprland = {
    enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha-mauve";
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };

  programs.steam = {
    enable = true;
  };

  services.blueman.enable = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  users.users.autumn = {
    isNormalUser = true;
    description = "Autumn";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
    shell = pkgs.nushell;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    pavucontrol
    wget
    networkmanagerapplet
    nh
    gparted
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "CaskaydiaCove Nerd Font";
      fontSize = "12";
    })
  ];

  fonts = {
    packages = [
      pkgs.nerd-fonts.caskaydia-cove
    ];
    fontconfig = {
      defaultFonts =
        let
          font = "CaskaydiaCove Nerd Font";
        in
        {
          serif = [ font ];
          sansSerif = [ font ];
          monospace = [ font ];
          emoji = [ font ];
        };
    };
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    SUDO_EDITOR = "nvim";
    SHELL = "nu";
  };

  system.stateVersion = "24.05";
}
