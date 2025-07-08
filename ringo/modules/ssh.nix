{...}: {
  services.openssh = {
    enable = true;
  };
  programs.ssh = {
    extraConfig = ''
      Host nix
        HostName 145.239.135.194
        User root
        IdentitiesOnly yes
        IdentityFile ~/.ssh/vpn
      Host sodies
        HostName 13.51.6.188
        User root
        IdentitiesOnly yes
        IdentityFile ~/.ssh/patryk2.pem
      Host sodies2
        HostName 13.60.6.56
        User root
        IdentitiesOnly yes
        IdentityFile ~/.ssh/patryk2.pem
      Host ooki
        User spike
        HostName 192.168.8.127
        IdentitiesOnly yes
        IdentityFile ~/.ssh/ooki
      Host kangae
        User spike
        HostName 192.168.8.110
        IdentitiesOnly yes
        IdentityFile ~/.ssh/ooki
      Host ezbm
        HostName 91.99.92.104
        User spike
        Port 65522
        IdentitiesOnly yes
        IdentityFile ~/.ssh/id_ed25519
    '';
  };
  programs.ssh.knownHosts = {
    nixbuild = {
      hostNames = ["eu.nixbuild.net"];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAgPWfxBgyT/OGKA2G7Aw7kLflEi2KcaxqEL0lTDshgs";
    };
  };
}
