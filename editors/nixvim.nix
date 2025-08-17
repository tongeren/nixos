{ config, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    # extraLuaConfig = 
  };
}