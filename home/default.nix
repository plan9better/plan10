{
  pkgs,
  username,
  headless,
  ...
}: {
  imports =
    [
      ./shell.nix
      ./core.nix
      ./git.nix
    ]
    ++ (
      if headless
      then []
      else [../modules/ghostty.nix]
    );

  home = let
    homeDir =
      if pkgs.stdenv.isLinux
      then "/home/${username}"
      else "/Users/${username}";
  in {
    username = username;
    homeDirectory =
      if username == "root"
      then "/root"
      else homeDir;

    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
