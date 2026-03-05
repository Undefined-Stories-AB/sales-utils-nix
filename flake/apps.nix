{
  lib,
  self,
  ...
}:
{
  perSystem =
    {
      inputs',
      pkgs,
      system,
      ...
    }:
    {
      apps = import "${self}/apps" {
        inherit
          lib
          pkgs
          inputs'
          self
          system
          ;
      };
    };
}
