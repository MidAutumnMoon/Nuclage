{

  description = "Nuran's packages";


  inputs =
    {

      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

      # Overlays from other projects by MidAutumnMoon
      Opah =
        { url = "github:MidAutumnMoon/Opah";
          inputs.nixpkgs.follows = "nixpkgs";
        };

    };


  outputs = { self, nixpkgs, ... } @ flake:

    let

      system = "x86_64-linux";

    in

    rec {
      # Softwares packaged by Nuclage.
      #
      overlay = import ./default.nix;


      # Nuclage's overlay plus other projects'
      #
      totalOverlays = with flake;
        [
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
