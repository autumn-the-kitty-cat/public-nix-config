{...}: {
    programs.nixvim = {
        autoCmd = [
            {
                event = [ "VimLeave" ];
                command = ":set guicursor=a:ver90-blinkon0";
            }
        ];        
        diagnostic.settings = {
            virtual_lines = {
                current_line = true;
            };
            float = {
                border = "rounded";
                source = "always";
            };
        };
        opts = {
            shell = "nu";
            
            fillchars = "eob: ";

            number = true;
            relativenumber = true;

            tabstop = 4;
            softtabstop = 4;
            showtabline = 4;
            shiftwidth = 4;
            expandtab = true;
            smartindent = true;
            breakindent = true;

            hlsearch = true;
            incsearch = true;
            ignorecase = true;
            smartcase = true;

            splitbelow = true;
            splitright = true;

            mouse = "a";

            updatetime = 50;

            swapfile = false;
            backup = false;
            undofile = true;

            scrolloff = 10;

            cursorline = true;

            wildmenu = true;
        };
    };
       }
