{
  description = "My system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    ...
  } @ inputs: let
    user = "boonhuikhong";
    darwinSystems = ["aarch64-darwin" "x86_64-darwin"];
  in {
    darwinPackages = self.darwinConfigurations.${user}.pkgs;
    darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (
      system:
        nix-darwin.lib.darwinSystem {
          specialArgs = {inherit self user inputs system;};
          modules = [./hosts/darwin/configuration.nix];
        }
    );
  };
}
