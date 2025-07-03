{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs.python3Packages; [
    python
    venvShellHook
  ];
  venvDir = "~/venvs/localdev";
}
