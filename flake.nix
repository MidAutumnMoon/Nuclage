{

  description = "Nuran's packages";


  inputs =
    {

      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

      # Used to pin Firefox at 97, until
      # new version become available in cache.
      nixpkgs-alter.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

      # Overlays from other repos by MidAutumnMoon
      #
      Opah =
        { url = "github:MidAutumnMoon/Opah";
          inputs.nixpkgs.follows = "nixpkgs";
        };

    };


  outputs = { self, nixpkgs, ... } @ flake:

    let

      system = "x86_64-linux";

      temporaryOverlay = final: prev:
        let
          alter-pkgs =
            import flake.nixpkgs-alter { inherit (final) system; };
        in
        {
          firefox = alter-pkgs.firefox;
          chromium = alter-pkgs.chromium;
        };

    in

    rec {
      # Softwares packaged by Nuclage.
      #
      overlay = import ./default.nix;


      # Nuclage's overlay plus other projects'
      #
      totalOverlays = with flake;
        [
          temporaryOverlay
          Opah.overlay
          self.overlay
        ];


      # For tesing the packages.
      #
      packages.${system} = import nixpkgs
        {
          inherit system;
          overlays = totalOverlays;
        };

    };

}
