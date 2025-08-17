{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true; # Has to be enabled here as well, in order for ~/.zshrc to be created
    syntaxHighlighting = {
      enable = true;
      styles = {
        alias = "fg=magenta,bold";
        unknown-token = "fg=red";
        precommand = "fg=#23f93d";
        command = "fg=#24eef9,bold";
        path = "fg=#24eef9";
        globbing = "fg=#24eef9";
      };
    };
    shellAliases = {
      # ls, the common ones I use exa for ls
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -lAFh"; # long list, show almost all, show type, human readable
      lt = "ls -la --sort=modified"; # sorted by date, recursive, show type, human readable
      lr = "ls -la --sort=modified --reverse"; # sorted by date, recursive, show type, human readable
      ldot = "ls -ld .*";
      lst = "ls -T"; # ls with tree
      llt = "ls -lT"; # ls -l with tree
      lat = "ls -laT"; # ls -la with tree
      latr = "ls -laT --sort=modified --reverse"; # ls -la with tree
      # NixOS
      update = "sudo nixos-rebuild switch";
      vi = "nvim";
      g = "lazygit";
      # Docker
      dexec = "docker exec -it";
      drun = "docker compose run --rm";
      dup = "docker compose up -d webserver";
      dhalt = "docker compose down";
      dreload = "docker compose down && docker compose up -d webserver";
      drmall = "docker rm -f $(docker ps -a -q)";
      # Usage: dgetip <container_id>
      dgetip = "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'";
      # Tree overwrite
      tree = "ls -laT"; # ls -la with tree
      # Colorize grep output (good for log files)
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      # confirm before overwriting something
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";
      # find & grep
      ff = "find . -type f -name";
      # ansible
      av = "ansible-vault";
      avv = "ansible-vault view";
      # easier to read disk
      df = "df -h"; # human-readable sizes
      free = "free -m"; # show sizes in MB
      # get top process eating memory
      psmem = "ps auxf | sort -nr -k 4 | head -5";
      # get top process eating cpu
      pscpu = "ps auxf | sort -nr -k 3 | head -5";
      "-g ..." = "../..";
      "-g ...." = "../../..";
      "-g ....." = "../../../..";
      "-g ......" = "../../../../..";
      "-- -" = "cd -";
      "1" = "cd -1";
      "2" = "cd -2";
      "3" = "cd -3";
      "4" = "cd -4";
      "5" = "cd -5";
      "6" = "cd -6";
      "7" = "cd -7";
      "8" = "cd -8";
      "9" = "cd -9";
      md = "mkdir -p";
      rd = "rmdir";
      # Helper utilities
      myip = "dig +short myip.opendns.com @resolver1.opendns.com";
      # Random password with any character
      pwgen = "openssl rand -base64 256 | tr -dc '[:print:]' | head -c 32";
      # Random password with only alphanumeric characters
      pwgena = "openssl rand -base64 256 | tr -d '\n' | head -c 32";
      cat = "bat -pp --theme \"Dracula\"";
      catt = "bat --theme \"Dracula\"";
    };
    history.size = 10000;
    initContent = ''
      neofetch
      
      setopt auto_cd
      setopt auto_pushd
      setopt pushd_ignore_dups
      setopt pushdminus
    ''; # Content to be added to ~/.zshrc.
    enableCompletion = true; # Enable zsh completion.
    autosuggestion.enable = true;
    plugins = [ ];
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ 
        "git"
        "gitfast"
        "last-working-dir"
        "common-aliases"
        "history-substring-search"
        "sudo" 
        "docker" 
        "kubectl" 
      ];
    };
  };
}  
