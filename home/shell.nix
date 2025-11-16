{
  pkgs,
  helix-plugins,
  ...
}: {
  programs.helix = import ./helix.nix {inherit helix-plugins pkgs;};

  programs.nushell = {
    enable = true;
    configFile.text = builtins.readFile ./config.nu;
    package = pkgs.nushell;
    plugins = [
      pkgs.nushellPlugins.gstat
    ];
    environmentVariables = {
      EDITOR = "hx";
      SHELL = "${pkgs.nushell}/bin/nu";
    };
    shellAliases = {
      vi = "hx";
      vim = "hx";
      nano = "hx";
      k = "kubecolor";
      ns = "nix-search";
      lg = "lazygit";
      gp = "rg -i";
      race = "typioca";
      g = "git";
      ghw = "gh run watch";
      prod = "cd ~/dev/work/prod_k8s";

      update = "nh darwin switch ~/plan10/ringo#";
    };
  };
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      format = "$directory $git_branch$git_status\n$character";

      add_newline = false;
      scan_timeout = 10;

      directory = {
        style = "cyan";
        truncate_to_repo = false;
        truncation_length = 0;
        fish_style_pwd_dir_length = 0;
        read_only = " (ro)";
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "yellow";
      };

      git_status = {
        format = " [$all_status$ahead_behind]($style)";
        style = "red";
        disabled = false;
      };

      character = {
        format = "; ";
        success_symbol = ";) ";
        error_symbol = ";( ";
      };
    };
  };
  programs.carapace.enable = true;
  programs.carapace.enableNushellIntegration = true;
}
