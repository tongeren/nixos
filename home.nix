{ config, pkgs, ... }:

{
  imports = [
    ./apps/alacritty.nix
    ./apps/chromium.nix
    ./apps/git.nix
    ./apps/lazygit.nix
    ./apps/starship.nix
    ./apps/ssh.nix
    ./apps/tmux.nix
    ./apps/zoxide.nix
    ./editors/vscode.nix
    ./editors/nixvim.nix
    ./shells/zsh.nix
  ];

  home.username = "tongeren";
  home.homeDirectory = "/home/tongeren";

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    neofetch # A command-line system information tool written in bash 3.2+
    nnn # A full-featured terminal file manager
    
    webcord # Discord and Spacebar client implemented without using the official Discord API   	
    signal-desktop
    slack
    
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    eza # A modern replacement for ls
    bat # A cat(1) clone with syntax highlighting and Git integration

    gtypist

    # misc
    tree
    ytdownloader
    video-downloader 
    vlc
    zsh-powerlevel10k
  ];
  
  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion =  "24.11";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}  
