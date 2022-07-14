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

      config =
        { allowUnfree = true; };

      pkgsForSystem =
        lib.importNixpkgs {
          inherit nixpkgs config;
          overlays = self.totalOverlays;
        };

    in

    {

      # Various overlays...

      overlays.default =
        import ./default.nix { inherit lib; };


      # ...combined altogether...

      totalOverlays = with flake;
        (builtins.attrValues self.overlays);


      # ...may do some testings on them...

      packages =
        pkgsForSystem lib.id;


      # ...right into your shell...

      devShells = pkgsForSystem ( pkgs: with pkgs;
        mkShellNoCC {
          packages = [ fish yq-go nix-build-uncached ];
        } );
    };

}
