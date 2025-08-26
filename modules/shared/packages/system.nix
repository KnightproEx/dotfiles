{pkgs}:
with pkgs; [
  tmux

  # Compiler
  cmake
  gnumake
  rustc
  clangStdenv
  clang
  gcc

  # Privacy
  gnupg
  age
  sops
  openvpn

  # Editor
  neovim
  vscode
  nixd
  biome
  # rust-analyzer
  typescript-language-server
  tailwindcss-language-server
  lua-language-server
  bash-language-server
  yaml-language-server
  dockerfile-language-server-nodejs
  python313Packages.python-lsp-server
  terraform-ls
  vscode-langservers-extracted
  emmet-ls
  helm-ls
  gopls
  prettier # prettierd
  # eslint # eslint_d
  stylua
  tflint
  rustfmt
  shfmt
  shellcheck
  shellharden
  alejandra
]
