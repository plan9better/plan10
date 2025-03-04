{...}: {
  /*
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export PATH="/opt/homebrew/bin:$PATH"
    '';
  };
  programs.nushell = {
    enable = true;
  };
  */
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set-option -g default-shell "/bin/bash"  # Or path to your shell, e.g., /bin/zsh
      set-option -g default-command "/bin/bash -i"  # Forces interactive mode
    '';
  };

  home.shellAliases = {
    k = "kubectl";

    urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  };
}
