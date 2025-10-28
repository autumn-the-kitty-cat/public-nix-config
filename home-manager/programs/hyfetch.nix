{ ... }:
{
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      color_align.mode = "horizontal";
      backend = "fastfetch";
      pride_month_disable = true;
    };
  };
}
