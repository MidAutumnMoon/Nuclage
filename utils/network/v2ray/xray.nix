{ lib, buildGo118Module, fetchFromGitHub }:

let

  variant = "xray";

  name =
    "${variant}-core";

  srcRev =
    "5e323958b6f9e57180b13480b64301b6473a97c1";

  srcHash =
    "BmeRLPQdGsgVJdkUnZXLgp09/hQt5WKxxM/yUYw4q2Y=";

  vendorHash =
    "sha256-85gtubSaeRiTcbzmK4ivWZEuc1ZdIR9RLFtVmRABd4I=";



in

buildGo118Module {

  pname = name;
  version = "unstable";

  src = fetchFromGitHub
    { owner = "XTLS";
      repo = name;
      sha256 = srcHash;
      rev = srcRev;
    };

  vendorSha256 = vendorHash;

  doCheck = false;

  GOAMD64 = "v2";

  installPhase = ''
      mkdir --parent "$out/bin"
      cp --verbose \
        "$GOPATH/bin/main" "$out/bin/${variant}"
    '';

  meta =
    { license = lib.licenses.mpl20;
      homepage = "https://github.com/XTLS";
      mainProgram = variant;
    };

  passthru =
    { inherit variant; };

}
