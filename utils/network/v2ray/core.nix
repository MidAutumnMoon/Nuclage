{ lib, buildGoModule, fetchFromGitHub }:

let

  name =
    "v2ray-core";

  srcRev =
    "fc6ae4d4e7f5158d7222a42c749d2bf7ca913632";

  srcHash =
    "sha256-PBDdQHbw8iK9w/UOA3Q+WuYk+WtqiF7gn/YtTgSRH10=";

  vendorHash =
    "sha256-bxasyCuu8hBTxgYnr4lfLdWq5WXiyvHySRgWLOqpVTM=";


  coreSrc = fetchFromGitHub
    { owner = "v2fly";
      repo = name;
      sha256 = srcHash;
      rev = srcRev;
    };

in

buildGoModule {

  pname = name;
  version = "unstable";
  src = coreSrc;

  vendorSha256 =
    vendorHash;

  doCheck =
    false;

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
