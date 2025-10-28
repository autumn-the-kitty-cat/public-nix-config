{ config, ... }:
{
  home.file.".config/waybar/config".text = ''
    {
        "position": "top",
        "spacing": 4,
        "modules-left": ["custom/icon", "ext/workspaces", "tray"],
        "modules-center": ["clock"],
        "modules-right": ["pulseaudio", "cpu", "memory", "temperature", "battery"],
        "custom/icon": {
            "format": " ",
            "tooltip": false
        },
        "tray": {
            "spacing": 10
        },
        "clock": {
            "format": "{:L%Y-%m-%d<small>[%a]</small> <tt><small>%p</small></tt>%I:%M}"
        },
        "cpu": {
            "format": " {usage}%",
            "tooltip": false
        },
        "memory": {
            "format": " {}%"
        },
        "temperature": {
            "thermal-zone": 2,
            "critical-threshold": 80,
            "format-critical": "{icon} {temperatureC}°C",
            "format": "{icon} {temperatureC}°C",
            "format-icons": ["", "", ""]
        },
        "battery": {
            "states": {
                "good": 95,
                "warning": 30,
                "critical": 15
            },
            "format": "{icon} {capacity}%",
            "format-charging": " {capacity}%",
            "format-plugged": " {capacity}%",
            "format-alt": "{icon} {time}",
            "format-icons": ["", "", "", "", ""]
        },
        "pulseaudio": {
            "scroll-step": 5, // %, can be a float
            "format": "{icon} {volume}% {format_source}",
            "format-bluetooth": " {icon} {volume}% {format_source}",
            "format-bluetooth-muted": "  {icon} {format_source}",
            "format-muted": "  {format_source}",
            "format-source": " {volume}%",
            "format-source-muted": "",
            "format-icons": {
                "default": ["", "", ""]
            },
            "on-click-right": "pavucontrol",
        },
    }
  '';
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "${config.stylix.fonts.serif.name}";
      	font-size: 16px;
      	min-height: 10px;
      }

      #custom-icon,
      #workspaces,
      #tray,
      #clock,
      #pulseaudio, 
      #cpu, 
      #memory,
      #temperature,
      #battery {
        border-width: 2px;
        border-style: solid;
        border-color: #${config.stylix.base16Scheme.palette.base0D};
        border-radius: 10px;
      	margin-top: 6px;
      	margin-left: 8px;
      	padding-left: 10px;
      	margin-bottom: 0px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
      	color: #${config.stylix.base16Scheme.palette.base05};
      	background: #${config.stylix.base16Scheme.palette.base00};
      }

      #custom-icon {
        margin-left: 10px;
      }
      #memory {
        margin-right: 10px;
      }


      window#waybar {
      	background: transparent;
      }

      window#waybar.hidden {
      	opacity: 0.2;
      }

      #window {
      	margin-top: 6px;
      	padding-left: 10px;
      	padding-right: 10px;
      	border-radius: 10px;
      	transition: none;
        color: transparent;
      	background: transparent;
      }

      #battery.critical:not(.charging) {
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
        to {
          background-color: #${config.stylix.base16Scheme.palette.base08};
        }
      }

      #workspaces button.active {
        color: #${config.stylix.base16Scheme.palette.base0E};
      }
    '';
  };
}
