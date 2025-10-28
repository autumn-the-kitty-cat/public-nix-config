{...}: {
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>n";
        action = "<cmd>NvimTreeToggle<cr>";
      }

      {
        mode = ["n" "i" "v" "t"];
        key = "<c-\\>";
        action = "<cmd>ToggleTerm<cr>";
      }

      {
        mode = ["n" "i" "v"];
        key = "<c-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
      }

      {
        mode = ["n" "i" "v"];
        key = "<c-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
      } 


      {
        mode = ["n" "i" "v"];
        key = "<c-j>";
        action = "<cmd>BufferLineGoToBuffer 1<cr>";
      } 


      {
        mode = ["n" "i" "v"];
        key = "<c-k>";
        action = "<cmd>BufferLineGoToBuffer -1<cr>";
      } 

      {
        mode = "n";
        key = "<leader><leader>";
        action = "<cmd>Yazi<cr>";
      }

      {
        mode = "n";
        key = "<leader>a";
        action = "<cmd>AerialToggle<cr>";
      }

      {
        mode = "n";
        key = "{";
        action = "<cmd>AerialPrev<cr>";
      }

      {
        mode = "n";
        key = "}";
        action = "<cmd>AerialNext<cr>";
      }

      {
          mode = "n";
          key = "<leader>c";
          action = ":hori term ";
      }
    ];
  };
}
