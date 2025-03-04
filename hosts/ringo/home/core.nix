{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    clickhouse
    xz
    unzip
    p7zip
    pnpm
    ffmpeg

    # od wojtka
    # zsh-powerlevel10k
    meslo-lgs-nf
    nodejs_22
    typescript-language-server
    skopeo
    rsync
    clickhouse

    # utils
    ripgrep 
    jq 
    fzf 

    nmap 

    # misc
    cowsay
    file
    which
    tree
    caddy
    gnupg
    kubectl

  ];
  
  programs = {
    helix = {
      enable = true;
      settings = {
        theme = "github_dark_high_contrast";  
      };
    };
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    vscode = {
      enable = true;
    };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        zstyle ':completion:*' menu select
        setopt auto_cd
        autoload -U up-line-or-beginning-search
        autoload -U down-line-or-beginning-search
        zle -N up-line-or-beginning-search
        zle -N down-line-or-beginning-search
        bindkey "^[[A" up-line-or-beginning-search
        bindkey "^[[B" down-line-or-beginning-search
      '';
  
      shellAliases = {
        ll = "ls -l";
        update = "darwin-rebuild switch --flake ~/.config/nix-darwin";
        "s3-prod" = "aws s3 --profile pl-3";
        "flake-init" = "nix flake init -t github:hercules-ci/flake-parts";
        "homeman" = "hx ~/.config/home-manager/home.nix";
      };
      plugins = [ 
        /*{
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }*/
      ];
      oh-my-zsh = {
        enable = true;
        plugins = [ ];
      };
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
