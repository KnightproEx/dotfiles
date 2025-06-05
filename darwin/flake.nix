{
  description = "My Darwin System flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      nix-homebrew,
      sops-nix,
    }@inputs:
    let
      username = "bh";
      platform = "aarch64-darwin";
      hostname = "bh-mac";
    in
    {
      darwinPackages = self.darwinConfigurations.${username}.pkgs;
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit
            self
            inputs
            username
            hostname
            platform
            ;
        };
        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs username; };
              users.${username} = import ./home.nix;
            };
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = username;
            };
          }
        ];
      };
    };
}
