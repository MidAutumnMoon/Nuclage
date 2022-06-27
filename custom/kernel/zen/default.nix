{ lib, linuxPackages_zen, llvmPackages_14 }:

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
        };

    # The original plan is to
    # get the configfile from a "sacrificeKernel"
    # and override it, then pass the
    # clang-able config to this "innocentKernel".

    innocentKernel = super.kernel.override
      { stdenv =
          llvmPackages_14.stdenv;
        argsOverride.structuredExtraConfig =
          kernelConfigs;
      };

    awesomeKernel = innocentKernel.overrideAttrs ( oldAttrs:
      { LLVM = 1;
        LLVM_IAS = 1;
        NIX_CFLAGS_COMPILE =
          "-march=x86-64-v3 -mtune=znver2";

        nativeBuildInputs =
            oldAttrs.nativeBuildInputs
          ++
            [ llvmPackages_14.bintools ];

        inherit (oldAttrs)
          passthru;
      } );

  in

  {

    kernel =
      awesomeKernel;

  } )
