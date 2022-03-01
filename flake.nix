{

  description = "Nuran's packages";


  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };


  outputs = { self, nixpkgs, ... } @ flake:

    let

      system = "x86_64-linux";

    in

      {
        overlay = import ./default.nix;

        # For tesing the packages.
        #
        packages.${system} = import nixpkgs
          {
            inherit system;
            overlays =
              [
                self.overlay
              ];
          };

      };

}
