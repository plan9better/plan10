{username, ...}: {
  imports = [
    ./shell.nix
    ./core.nix
    ./git.nix
    ./starship.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
