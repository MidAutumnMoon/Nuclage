{ lib, callPackage }:

callPackage ./coremon.nix rec {

  srcRev =
    "340234166b2ee994136aa346a25f53b367d28059";

  srcHash =
    "sha256-bHp/OZbCAQsWdf4qvKKHde23dnuY37gS2ehlFhxIvO0=";

  vendorHash =
    "sha256-F+CrlFLQpbhLT8w3frA9vdyqfDDhkhzLsTxrYhr9ph8=";

  srcUrl =
    "https://github.com/XTLS/Xray-core";

  variant = "xray";

  meta =
    { license = lib.licenses.mpl20;
      homepage = "https://www.v2fly.org/";
      mainProgram = variant;
    };

}
