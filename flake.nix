{
  description = "My system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      # url = "github:youwen5/zen-browser-flake";
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    walker.url = "github:abenz1267/walker";
    xremap-flake.url = "github:xremap/nix-flake";
    yazi.url = "github:sxyazi/yazi";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    ...
  } @ inputs: let
    user = "bh";
    hostname = "nix-machine";

    linuxSystems = ["x86_64-linux" "aarch64-linux"];
    darwinSystems = ["aarch64-darwin" "x86_64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs (linuxSystems ++ darwinSystems);
  in {
    legacyPackages = forAllSystems (
      system:
        import inputs.nixpkgs {
          inherit system;
          # overlays = builtins.attrValues overlays;
          config.allowUnfree = true;
        }
    );

    devShells = forAllSystems (system: {
      pythonVenv = nixpkgs.legacyPackages.${system}.callPackage ./shells/pythonVenv.nix {};
      node = nixpkgs.legacyPackages.${system}.callPackage ./shells/node.nix {};
    });

    nixosConfigurations = nixpkgs.lib.genAttrs linuxSystems (
      system:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {inherit inputs user hostname;};
          modules = [./hosts/nixos/configuration.nix];
        }
    );

    darwinPackages = self.darwinConfigurations.${user}.pkgs;
    darwinConfigurations = nixpkgs.lib.genAttrs (darwinSystems ++ ["work"]) (
      system:
        nix-darwin.lib.darwinSystem {
          specialArgs =
            if system == "work"
            then {
              user = "boonhuikhong";
              hostname = "BPSG-MAC0031";
              system = "aarch64-darwin";
              inherit self inputs;
            }
            else {inherit user hostname self inputs system;};
          modules = [./hosts/darwin/configuration.nix];
        }
    );
  };
}
