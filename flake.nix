{

  description = "Nuran's packages";


  inputs =
    {

      nixpkgs.url =
        "github:NixOS/nixpkgs/nixos-unstable-small";

      nulib.url =
        "github:MidAutumnMoon/Nulib";


      # MidAutumnMoon's 1p overlays

    };


  outputs = { self, nixpkgs, nulib, ... } @ flake:

    let

      lib =
        nixpkgs.lib.extend nulib.lib;

      pkgsForSystem =
        lib.importNixpkgs {
          inherit nixpkgs;
          overlays = self.totalOverlays;
        };

    in

    {

      # Various overlays...

      overlays.default =
        import ./default.nix;


      # ...combined altogether...

      totalOverlays = with flake;
        (builtins.attrValues self.overlays);


      # ...may do some testings to them...

      packages =
        pkgsForSystem lib.id;
    };

}
