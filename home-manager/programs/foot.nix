{...}: {
  programs.foot = {
    enable = true;
    settings = {
        cursor = {
            style = "beam";
        };
      key-bindings = {
        spawn-terminal = "none";
      };
    };
  };
}
