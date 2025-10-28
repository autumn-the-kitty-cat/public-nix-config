{pkgs, ...}:
{
    programs.nixvim.plugins.treesitter = {
        enable = true;
        settings = {
            auto_install = true;
            highlight.enable = true;
        };
#        grammarPackages = [
#            pkgs.vimPlugins.nvim-treesitter.builtGrammars.nu
#        ];
    };
}
