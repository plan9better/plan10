{
  pkgs,
  username,
  hostname,
  ...
} @ args: {
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;
  services.emacs.enable = true;

  users.users.patrykwojnarowski = {
    home = "/Users/patrykwojnarowski";
    shell = pkgs.nushell;
  };

  nix.settings.trusted-users = [username];
}
