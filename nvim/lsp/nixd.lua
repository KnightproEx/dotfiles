return {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", "git" },
	settings = {
		nixpkgs = {
			expr = "import <nixpkgs> { }",
		},
		nixd = {
			formatting = {
				command = { "nixfmt" },
			},
		},
		options = {
			nixos = {
				expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.bh-mac.options',
			},
			home_manager = {
				-- expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations.bh@bh-mac.options',
				-- expr = "(builtins.getFlake (builtins.toString ./.)).darwinConfigurations.bh-mac.options.home-manager.users.type.getSubOptions []",
				expr = '(builtins.getFlake ("git+file://" + toString ./.)).darwinConfigurations.bh-mac.options.home-manager.users.type.getSubOptions []',
			},
			nix_darwin = {
				expr = '(builtins.getFlake ("git+file://" + toString ./.)).darwinConfigurations.bh-mac.options',
			},
		},
	},
}
