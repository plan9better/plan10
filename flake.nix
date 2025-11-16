{
  description = "Nix for macOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    helix-plugins.url = "github:mattwparas/helix/steel-event-system";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/d06cf70";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    helix-plugins,
    ...
  }: let
    username = "patrykwojnarowski";
    gitusername = "plan9better";
    useremail = "plan9better@proton.me";

    darwinSystem = "aarch64-darwin";
    linuxSystem = "x86_64-linux";

    hostname = "ringo";

    specialArgs =
      inputs
      // {
        inherit username useremail hostname gitusername helix-plugins;
        headless = false;
      };
  in {
    # macOS system (nix-darwin + HM)
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      system = darwinSystem;
      inherit specialArgs;
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix
        ./modules/host-users.nix
        ./modules/ssh.nix

        # home manager on macOS
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home;
        }
      ];
    };

    # Docker container
    homeConfigurations.devenv = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${linuxSystem};
      extraSpecialArgs =
        specialArgs
        // {
          username = "root";
          headless = true;
        };
      modules = [
        ./home
      ];
    };

    formatter.${darwinSystem} = nixpkgs.legacyPackages.${darwinSystem}.alejandra;
    formatter.${linuxSystem} = nixpkgs.legacyPackages.${linuxSystem}.alejandra;
  };
}
