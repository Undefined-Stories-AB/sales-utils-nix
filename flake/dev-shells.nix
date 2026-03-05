{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      formatter = pkgs.nixfmt-tree;
      devShells = {
        default = pkgs.mkShellNoCC {
          # Correct nixd inlay hints
          env.NIX_PATH = "nixpkgs=${inputs.nixpkgs.outPath}";

          buildInputs = (
            with pkgs;
            [
              # https://github.com/NixOS/nix/issues/730#issuecomment-162323824
              bashInteractive
              findutils # xargs
              flake-edit
              nixfmt
              nixfmt-tree
              nixd
              go-task

              dprint
              typos
              zizmor
            ]
          );
        };
      };
    };
}
