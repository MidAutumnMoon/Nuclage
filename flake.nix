{

  description = "Nuran's packages";


  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };


  outputs = { self, nixpkgs, ... } @ flake:
    {

      overlay = import ./default.nix;

    };

}
