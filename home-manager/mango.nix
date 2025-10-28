# not yet fully functional

{ config, ... }:
{
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      border_radius=10

      bind=SUPER,q,spawn,foot
      bind=SUPER,d,spawn,rofi -show drun
      bind=SUPER+SHIFT,p,spawn,rofi -show power-menu -modi power-menu:rofi-power-menu

      bind=SUPER,c,killclient
      bind=SUPER,m,quit
      bind=SUPER,r,reload_config

      bind=SUPER,v,togglefloating

      bind=SUPER,Up,focusdir,up
      bind=SUPER,Down,focusdir,down
      bind=SUPER,Left,focusdir,left
      bind=SUPER,Right,focusdir,right

      bind=SUPER+SHIFT,Up,exchange_client,up
      bind=SUPER+SHIFT,Down,exchange_client,down
      bind=SUPER+SHIFT,Left,exchange_client,left
      bind=SUPER+SHIFT,Right,exchange_client,right

      bind=SUPER,1,view,1,0
      bind=SUPER,2,view,2,0
      bind=SUPER,3,view,3,0
      bind=SUPER,4,view,4,0
      bind=SUPER,5,view,5,0
      bind=SUPER,6,view,6,0
      bind=SUPER,7,view,7,0
      bind=SUPER,8,view,8,0
      bind=SUPER,9,view,9,0

      bind=SUPER+SHIFT,1,tag,1,0
      bind=SUPER+SHIFT,2,tag,2,0
      bind=SUPER+SHIFT,3,tag,3,0
      bind=SUPER+SHIFT,4,tag,4,0
      bind=SUPER+SHIFT,5,tag,5,0
      bind=SUPER+SHIFT,6,tag,6,0
      bind=SUPER+SHIFT,7,tag,7,0
      bind=SUPER+SHIFT,8,tag,8,0
      bind=SUPER+SHIFT,9,tag,9,0

      tagrule=id:1,layout_name:tile,no_hide:1
      tagrule=id:2,layout_name:tile,no_hide:1
      tagrule=id:3,layout_name:tile,no_hide:1
      tagrule=id:4,layout_name:tile,no_hide:1
      tagrule=id:5,layout_name:tile,no_hide:1
      tagrule=id:6,layout_name:tile,no_hide:1
      tagrule=id:7,layout_name:tile,no_hide:1
      tagrule=id:8,layout_name:tile,no_hide:1
      tagrule=id:9,layout_name:tile,no_hide:1

      mousebind=SUPER,btn_left,moveresize,curmove
      mousebind=SUPER,btn_right,moveresize,curresize

      exec-once=swww-daemon
      exec-once=flameshot

      exec=swww img ${config.stylix.image}
      exec=pkill waybar; waybar

      cursor_size=24

      env=XCURSOR_SIZE,24

      monitorrule=DP-2,0.55,1,tile,0,1,0,0,2560,1440,180
      monitorrule=HDMI-A-1,0.55,1,tile,0,1,0,0,1920,1080,60

      borderpx=2
      bordercolor=0x595959aa
      focuscolor=${config.stylix.base16Scheme.palette.base0D}ff

      new_is_master=0
      view_current_to_back=0
      drag_tile_to_tile=1
    '';
  };
}
