{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip
    jot
    less

    # lsp adjacent
    typescript-language-server
    bash-language-server
    jsonfmt
    nil
    alejandra
    nufmt

    # langs
    python3

    # utils
    ripgrep
    cfssl
    jq
    fzf
    typioca
    nix-search-cli
    skopeo
    rsync
    nmap
    lazygit
    ffmpeg
    btop
    nh
    k9s
    tio

    # clients
    clickhouse
    kubectl

    # misc
    file
    which
    tree
    gnupg
    qemu
    kubecolor
  ] ++ ( if pkgs.stdenv.isDarwin then [pkgs.iproute2mac] else []);

  programs = {
    direnv = {
      # let
      #   myDirenv = import ../direnv;
      # in {
      #   package = myDirenv.default;
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };

    awscli = {
      enable = true;
      settings = {
        "profile pl-3" = {
          region = "any";
          endpoint_url = "http://pl-3--s3.goat-betta.ts.net";
        };
        "profile pl-1" = {
          region = "any";
          endpoint_url = "https://minio.pl-1.dialo.ai";
        };
      };
      credentials = {
        "pl-3" = {
          aws_access_key_id = "any";
          aws_secret_access_key = "any";
        };
      };
    };
  };
}
