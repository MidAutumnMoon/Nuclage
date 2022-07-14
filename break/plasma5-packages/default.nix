{ plasma5Packages , emptyDirectory }:

plasma5Packages.overrideScope' ( self: super: {

  kdeGear = super.kdeGear.overrideScope' ( gearSelf: gearSuper:
    { elisa =
        emptyDirectory;

      kinfocenter =
        emptyDirectory;

      plasma-systemmonitor =
        emptyDirectory;

      print-manager =
        emptyDirectory;

      gwenview =
        emptyDirectory;

      khelpcenter =
        emptyDirectory;
    } );

  plasma5 = super.plasma5.overrideScope' ( plasmaSelf: plasmaSuper:
    { plasma-browser-integration =
        emptyDirectory;
    } );

} )
