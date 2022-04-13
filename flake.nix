{

  description = "Nuran's packages";


  inputs =
    {

      nixpkgs.url =
        "github:NixOS/nixpkgs/nixos-unstable-small";

      nulib.url =
        "github:MidAutumnMoon/Nulib";

      slightly-older-nixpkgs.url =
        "nixpkgs/04ce3788d37dc3f5ab1b156f2a817c8e7630b3b4";


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


      # New glibc breaks Firefox 99

      olderPkgsForSystems =
        lib.importNixpkgs { nixpkgs = flake.slightly-older-nixpkgs; };

      overrideFirefoxOverlay = self: super:
        {
          inherit (olderPkgsForSystems."${self.system}")
            firefox-unwrapped;
        };

    in

    {

      # Various overlays...

      overlays.default =
        import ./default.nix;


      # ...combined altogether...

      totalOverlays = with flake;
        [
          overrideFirefoxOverlay

          Opah.overlay
        ]
          ++ (builtins.attrValues self.overlays);


      # ...and also be able to build some of them...

      packages = pkgsForSystem lib.id;
    };

}
