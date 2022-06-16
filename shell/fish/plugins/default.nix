{ fishPlugins }:

fishPlugins.overrideScope' ( self: super: {

  tide =
    self.callPackage ./tide.nix {  };

} )
