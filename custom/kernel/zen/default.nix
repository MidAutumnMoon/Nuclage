{ lib, linuxPackages_zen }:

linuxPackages_zen.extend ( self: super:

  let

    #
    # Enable LTO for kernels is sadly
    # an uneasy task with nixpkgs.
    #
    # First of all, the kbuild checks for
    # Clang toolchain (clang, lld etc.)
    # to deteermine whether doing LTO is feasible,
    # which means both the kernel and the configfile
    # derivation needs to be overrided
    # in order to enable proper LLVM support.
    #
    # And here comes the biggest problem.
    #
    # It seems no way to pass the configfile which
    # successfully recognized LLVM and has LTO
    # options enabled after overriding to the
    # kernel derivation, since the configfile is
    # being referred lexically :(
    #
    # Thus the final kernel won't have
    # LTO options enabled at all.
    #

    kernelConfigs = with lib.kernel;
        import ../options { inherit lib; }
      //
        { ZEN_INTERACTIVE = yes;
          LRU_GEN = yes;
          LRU_GEN_ENABLED = yes;
        };

    # The original plan is to
    # get the configfile from a "sacrificeKernel"
    # and override it, then pass the
    # clang-able config to this "innocentKernel".

    innocentKernel = super.kernel.override ( krlOldArgs:
      { structuredExtraConfig =
            kernelConfigs // ( krlOldArgs.structuredExtraConfig or {} );
      } );

    awesomeKernel = innocentKernel.overrideDerivation ( krlOldAttrs:
      { NIX_CFLAGS_COMPILE =
          "-march=x86-64-v3 -mtune=znver2 ${krlOldAttrs.NIX_CFLAGS_COMPILE or ""}";
      } );

  in

  {

    kernel =
      awesomeKernel;

    zfsStable = super.zfsStable.overrideAttrs ( zfsOldAttrs:
      { NIX_CFLAGS_COMPILE =
          "-O3 -march=x86-64-v3 -mtune=znver2 ${zfsOldAttrs.NIX_CFLAGS_COMPILE or ""}";
      } );

  } )
