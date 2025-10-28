{pkgs, config, ...}: {
  home.packages = [
    pkgs.rofi-power-menu
    pkgs.rofi
  ];

    xdg.configFile."rofi/theme.rasi".text = with config.stylix.base16Scheme.palette; ''
    * {
      bg-col: #${base00};
      bg-col-light: #${base01};
      border-col: #${base0D};
      selected-col: #${base01};
      green: #${base0B};
      fg-col: #${base07};
      fg-col2: #${base06};
      grey: #${base04};
      highlight: @green;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration{
      modi: "run,drun,window";
      lines: 5;
      cycle: false;
      font: "${config.stylix.fonts.serif.name} 14";
      show-icons: true;
      icon-theme: "Papirus-dark";
      terminal: "ghostty";
      drun-display-format: "{icon} {name}";
      location: 0;
      disable-history: true;
      hide-scrollbar: true;
      display-drun: " Apps ";
      display-run: " Run ";
      display-window: " Window ";
      /* display-Network: " Network"; */
      sidebar-mode: true;
      sorting-method: "fzf";
    }

    @theme "theme"

    element-text, element-icon , mode-switcher {
      background-color: inherit;
      text-color:       inherit;
    }

    window {
      height: 530px;
      width: 600px;
      border: 2px;
      border-color: @border-col;
      background-color: @bg-col;
    }

    mainbox {
      background-color: @bg-col;
    }

    inputbar {
      children: [prompt,entry];
      background-color: @bg-col-light;
      border-radius: 5px;
      padding: 0px;
    }

    prompt {
      background-color: @green;
      padding: 4px;
      text-color: @bg-col-light;
      border-radius: 3px;
      margin: 10px 0px 10px 10px;
    }

    textbox-prompt-colon {
      expand: false;
      str: ":";
    }

    entry {
      padding: 6px;
      margin: 10px 10px 10px 5px;
      text-color: @fg-col;
      background-color: @bg-col;
      border-radius: 3px;
    }

    listview {
      border: 0px 0px 0px;
      padding: 6px 0px 0px;
      margin: 10px 0px 0px 6px;
      columns: 2;
      background-color: @bg-col;
      cycle: true;
    }

    element {
      padding: 8px;
      margin: 0px 10px 4px 4px;
      background-color: @bg-col;
      text-color: @fg-col;
    }

    element-icon {
      size: 28px;
    }

    element selected {
      background-color:  @selected-col ;
      text-color: @fg-col2  ;
      border-radius: 3px;
    }

    mode-switcher {
      spacing: 0;
    }

    button {
      padding: 10px;
      background-color: @bg-col-light;
      text-color: @grey;
      vertical-align: 0.5;
      horizontal-align: 0.5;
    }

    button selected {
      background-color: @bg-col;
      text-color: @green;
    }'';

  programs.rofi = {
    enable = false;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "run,drun";
      icon-theme = "WhiteSur";
      show-icons = true;
      terminal = "ghostty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " ⊞  Window ";
      sidebar-mode = true;
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        width = 600;
      };

      "element-text, element-icon, mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "window" = {
        height = mkLiteral "360px";
      };

      "inputbar" = {
        children = mkLiteral "[prompt,entry]";
        border-radius = mkLiteral "5px";
        padding = mkLiteral "2px";
      };

      "prompt" = {
        padding = mkLiteral "6px";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 0px 0px 20px";
      };

      "textbox-prompt-colon" = {
        expand = false;
        str = ":";
      };

      "entry" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 10px";
      };

      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        colums = 2;
        lines = 5;
      };

      "element" = {
        padding = mkLiteral "5px";
      };

      "element-icon" = {
        size = mkLiteral "25px";
      };

      "mode-switcher" = {
        spacing = 0;
      };

      "button" = {
        padding = mkLiteral "10px";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "message" = {
        margin = mkLiteral "2px";
        padding = mkLiteral "2px";
        border-radius = mkLiteral "5px";
      };

      "textbox" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 20px";
      };
    };
  };
}
