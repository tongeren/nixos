{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true; 
    package = pkgs.vscodium; # Ditch the telemetry, use vscodium
    profiles.default = {
      userSettings = {
        "editor.tabSize" = 2;
      };    
      extensions = with pkgs.vscode-extensions; [
    	  bbenoist.nix # Nix language support 
        rust-lang.rust-analyzer # Rust language support
        # vscod evim.vim # vim emulator
        # asvetliakov.vscode-neovim # Vim-mode for VS Code using embedded Neovim 
        # -> error: [Failed to start nvim] command 'type' already exists
        #    source: VSCode Neovim
        yzhang.markdown-all-in-one # markdown support        
      ];
    };
  };
}    

