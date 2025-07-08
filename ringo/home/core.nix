{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # lsp adjacent
    typescript-language-server
    bash-language-server
    python312Packages.python-lsp-server
    vscode-langservers-extracted
    jsonfmt
    nil
    alejandra
    nufmt

    # langs
    python3

    # utils
    ripgrep
    devenv
    cfssl
    jq
    fzf
    skopeo
    rsync
    nmap
    lazygit
    ffmpeg
    btop
    nh
    k9s
    iproute2mac
    glow
    mods

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
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
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
