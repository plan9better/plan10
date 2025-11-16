{...}: {
  services.openssh = {
    enable = true;
    # settings = {
    #   PermitRootLogin = false;
    #   PasswordAuthentication = false;
    #   KexAlgorithms = ["mlkem768x25519-sha256"];
    #   KbdInteractiveAuthentication = false;
    # };
  };
  # programs.ssh.enabled = true;
}
