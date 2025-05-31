{ ... }:
{

  programs.nixvim.performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
    # combinePlugins = {
    #   enable = true;
    #   standalonePlugins = [
    #   ];
    #
    # };

  };

  programs.nixvim.globals = {
    mapleader = ",";
  };
  programs.nixvim.opts = {
    number = true;
    relativenumber = false;
    showcmd = true;
    laststatus = 2;
    autowrite = true;
    cursorline = true;
    cursorcolumn = true;
    history = 10000;
    showmode = false;

    # tabs
    shiftwidth = 4;
    tabstop = 4;
    # roud to nearest tabsize
    shiftround = true;
    # use spaces for tab
    expandtab = true;

    # indentations
    autoindent = true;
    smartindent = true;
    # -- read more on this
    # cindent = true

    hlsearch = true;
    ignorecase = true;
    smartcase = true;

    # git signs
    signcolumn = "yes";

    # tab completion options as a menu
    wildmenu = true;

    spelllang = "en_gb";

    # space between line and bottom/top of buffer
    scrolloff = 4;
    # sidescrolloff= 20

    # TESTING this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test this is a looooooong test LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO

    # use term gui colors
    termguicolors = true;

    # Set completeopt to have a better completion experience
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ]; # mostly just for cmp

    # Enable persistent undo history
    swapfile = false;
    autoread = true;
    backup = false;
    undofile = true;

    encoding = "utf-8";
    fileencoding = "utf-8";

    # clipboard = "osc52";
  };

  programs.nixvim.clipboard = {
    register = "unnamed";
    providers.wl-copy.enable = true;
  };

}
