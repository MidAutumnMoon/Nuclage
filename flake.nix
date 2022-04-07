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


      # Overlays from other projects by MidAutumnMoon

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


      # Firefox 99 breaks itself.

      olderPkgsForSystems =
        lib.importNixpkgs { nixpkgs = flake.slightly-older-nixpkgs; };

      overrideFirefoxOverlay = self: super:
        {
          inherit (olderPkgsForSystems."${self.system}")
            firefox-unwrapped;
        };

    in

    {
      # Softwares packaged by Nuclage.

      overlay = import ./default.nix;


      # Nuclage's overlay plus other projects'

      totalOverlays = with flake;
        [
          overrideFirefoxOverlay

          Opah.overlay
          self.overlay
        ];


      packages = pkgsForSystem lib.id;
    };

}
