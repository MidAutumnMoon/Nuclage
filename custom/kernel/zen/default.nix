{ lib, gcc12Stdenv, linuxPackages_zen }:

linuxPackages_zen.extend ( self: super:

  let

    kernelConfigs = with lib.kernel;
        import ../options { inherit lib; }
      //
        { ZEN_INTERACTIVE = yes;
          LRU_GEN = yes;
          LRU_GEN_ENABLED = yes;
        };

    innocentKernel = super.kernel.override ( krlOldArgs:
      { structuredExtraConfig =
            kernelConfigs // ( krlOldArgs.structuredExtraConfig or {} );
        stdenv =
          gcc12Stdenv;
      } );

    awesomeKernel = innocentKernel.overrideDerivation ( krlOldDrv:
      { NIX_CFLAGS_COMPILE =
          "-fipa-pta -march=x86-64-v3 -mtune=znver2 ${krlOldDrv.NIX_CFLAGS_COMPILE or ""}";
      } );

  in

  {

    kernel =
      awesomeKernel;

    zfsStable = super.zfsStable.overrideAttrs ( zfsOldAttrs:
      { NIX_CFLAGS_COMPILE =
          "-O3 -march=x86-64-v3 -mtune=znver2 ${zfsOldAttrs.NIX_CFLAGS_COMPILE or ""}";
      } );

    nvidiaPackages = super.nvidiaPackages.extend ( nvidiaSelf: nvidiaSuper:
      { stable = nvidiaSuper.stable.override
          { disable32Bit = true; };
      } );

  } )
