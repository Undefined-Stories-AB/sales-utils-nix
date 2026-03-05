{
  flake-parts,
  systems,
  self,
  ...
}@inputs:
let
  mySystems = import systems;
in
flake-parts.lib.mkFlake { inherit inputs; } {
  systems = mySystems;

  imports = [
    ./apps.nix
    ./dev-shells.nix
    ./lib.nix
  ];
}
