{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    masApps = {};

    taps = [
      "homebrew/services"
    ];

    brews = [
      "wireshark"
      "openvpn"
    ];

    casks = [
      "utm"
      "emacs"
      "ghostty"
      "slack"
      "discord"
      "spotify"
      "steam"
      "obsidian"
      "brave-browser"
      "visual-studio-code"
    ];
  };
}
