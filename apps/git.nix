{ config, ... }:

{
  programs.git = {
    enable = true;
    userName = "Duncan van Tongeren";
    userEmail = "dpvantongeren@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}  
