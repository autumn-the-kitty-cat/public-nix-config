{ ... }:
{
  programs.nixvim.plugins.codesnap = {
    enable = true;
    settings = {
      has_line_number = true;
      bg_theme = "grape";
      watermark = "";
    };
  };
}
