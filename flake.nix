{

  description = "Nuran's packages";


  inputs =
    {

      nixpkgs.url =
        "github:NixOS/nixpkgs/nixos-unstable-small";

      nulib.url =
        "github:MidAutumnMoon/Nulib";


      # MidAutumnMoon's 1p overlays

      Opah =
        { url = "github:MidAutumnMoon/Opah";
          inputs.nixpkgs.follows = "nixpkgs";
          inputs.nulib.follows = "nulib";
        };

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
        [
          Opah.overlay
        ]
          ++ (builtins.attrValues self.overlays);


      # ...and also be able to build some of them...

      packages = pkgsForSystem lib.id;
    };

}
