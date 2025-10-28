{...}: {
  imports = [
    ./codesnap.nix
    ./rustaceanvim.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
  ];

  programs.nixvim.plugins = {
    aerial.enable = true;
    bufferline.enable = true;
    colorizer.enable = true;
    comment.enable = true;
    crates.enable = true;
    fidget.enable = true;
    lazygit.enable = true;
    lsp-lines.enable = true;
    lualine.enable = true;
    nvim-tree.enable = true;
    nvim-autopairs.enable = true;
    quickmath.enable = true;
    render-markdown.enable = true;
    treesj.enable = true;
    visual-multi.enable = true;
    web-devicons.enable = true;
    yazi.enable = true;
  };
}
