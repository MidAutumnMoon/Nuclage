{ lib, callPackage }:

callPackage ./coremon.nix rec {

  srcRev =
    "ad51c065067ca51bc8d457a47aad9462eea39c67";

  srcHash =
    "sha256-YiX4Fp0OItoshnD3zxlOrcAWwSCdo3uXLKlPrbysCQI=";

  vendorHash =
    "sha256-qT16XRfuqnHImvI+CCuVDv1UIMbW2syZCwCPAC0GC7c=";

  srcUrl =
    "https://github.com/v2fly/v2ray-core";

  variant = "v2ray";

  meta =
    { license = lib.licenses.mit;
      homepage = "https://www.v2fly.org/";
      mainProgram = variant;
    };

}
