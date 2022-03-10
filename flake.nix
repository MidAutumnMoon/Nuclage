{

  description = "Nuran's packages";


  inputs =
    {

      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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

    in

    rec {
      # Softwares packaged by Nuclage.
      #
      overlay = import ./default.nix;


      # Nuclage's overlay plus other projects'
      #
      totalOverlays = with flake;
        [
          self.overlay
          Opah.overlay
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
