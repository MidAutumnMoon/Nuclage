{ lib, buildGo118Module, fetchFromGitHub }:

let

  name =
    "v2ray-core";

  srcRev =
    "8c6dfb2b6f3f6c0e16e8b8bf86262d17a3ec661c";

  srcHash =
    "TJG1uW90wKaaViPJ/NBju7wlvRvq812znbG5JAEslMg=";

  vendorHash =
    "sha256-swM6H3pbbRm/oDRkPHepEqAQvPHDmq1cVlusEvR9vhs=";


  coreSrc = fetchFromGitHub
    { owner = "v2fly";
      repo = name;
      sha256 = srcHash;
      rev = srcRev;
    };

in

buildGo118Module {

  pname = name;
  version = "unstable";
  src = coreSrc;

  vendorSha256 =
    vendorHash;

  doCheck =
    false;

  GOAMD64 = "v2";

  installPhase = ''
      mkdir --parent "$out/bin"
      cp --verbose \
        "$GOPATH/bin/main" "$out/bin/v2ray"
    '';

  meta =
    { license = lib.licenses.mit;
      homepage = "https://www.v2fly.org/";
      mainProgram = "v2ray";
    };

}
