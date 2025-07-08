{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "nu";
      theme = "ayu_dark";
    };
  };
  programs.helix = import ./helix.nix;

  programs.nushell = {
    enable = true;
    extraConfig = builtins.readFile ./config.nu;
    environmentVariables = {
      EDITOR = "hx";
      TERM = "xterm-256color";
      SHELL = "${pkgs.nushell}/bin/nu";
    };
    shellAliases = {
      vi = "hx";
      vim = "hx";
      nano = "hx";
      k = "kubecolor";
      zj = "zellij";
      lg = "lazygit";
      gp = "rg -i";
      g = "git";

      update = "nh darwin switch ~/plan10/ringo#";
    };
  };
  programs.carapace.enable = true;
  programs.carapace.enableNushellIntegration = true;
}
