{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    neovim
    git
    helix
    typescript-language-server
  ];
  environment.variables.EDITOR = "hx";

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    masApps = {
      # Xcode = 497799835;
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    brews = [
      "portaudio" # for pyaudio
     ];

    # `brew install --cask`
    casks = [
      "ghostty"
      "slack"
      "discord"
      "spotify"
      "beekeeper-studio"
      "messenger"
      "windsurf"
      "steam"
      "obsidian"
      # "firefox"
      # "google-chrome"
    ];
  };
}
