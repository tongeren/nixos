{ config, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      palette = "foo";

      palettes.foo = {
        mustard = "#af8700";
        time = "#778485";
        directory = "#FFFFFF";
        identity = "#778485";
        git_branch = "#000000";
        deleted = "#FF2C2C";
        added = "#008000";
      };

      fill.symbol = " ";

      username = {
        show_always = true;
        style_user = "identity";
        style_root = "red bold";
        format = "[](fg:#1C3A5E)[$user]($style bg:#1C3A5E)";
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = " 📞";
        style = "identity";
        format = "[@$hostname$ssh_symbol ]($style bg:#1C3A5E)"; 
      };

      directory = {
        truncation_length = 3;
        truncate_to_repo = false;
        read_only = "🔒 ";
        style = "directory bg:#3B76F0"; 
        format = "[](fg:#1C3A5E bg:#3B76F0)[$read_only$path ]($style)";
      };

      git_branch = {
        symbol = " ";
        style = "git_branch bold bg:#7DF9AA";
        format = "[](fg:#3B76F0 bg:#7DF9AA)[$symbol$branch(:$remote_branch) ]($style)";
      };

      git_status = {
        style = "fg:#FF2C2C bold bg:#7DF9AA";
        format = "[$all_status]($style)[ ](fg:#7DF9AA)";
      };

      git_metrics = {
        disabled = false;
        added_style = "added bold";
        deleted_style = "deleted bold";
      };

      time = {
        disabled = false;
        time_format = "%R";
        format = "[$time]($style)"; 
        style = "time bold";
      };

      cmd_duration = {
        style = "mustard bold";
        format = "[$duration]($style) ";
      };

      jobs = {
        format = "[$number$symbol]($style)";
        symbol = "⚙ ";
        style = "mustard bold";
      };

      format = let
        who = [
          "$username"
          "$hostname"
          "$directory"
        ];

        git = [
          "$git_branch"
          "$git_state"
          "$git_status"
          "$git_metrics"
        ];

        fill = [ "$fill" ];

        duration = [
          "$cmd_duration"
        ];

        time = [
          "$jobs"
          "$time"
        ];

        languages = [
          "$nix_shell"
          "$nodejs"
          "$elixir"
          "$lua"
        ];

        prompt = [
          "$line_break"
          "❯ "
        ];
      in
      lib.concatStrings (who ++ git ++ fill ++ duration ++ languages ++ time ++ prompt);     
    };  
  };
}