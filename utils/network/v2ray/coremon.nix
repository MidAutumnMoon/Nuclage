{ lib, buildGo118Module, fetchgit
,
  variant
, srcUrl
, srcRev
, srcHash
, vendorHash
, meta
}:

buildGo118Module {

  pname = "${variant}-core-teapot";
  version = "master";

  src = fetchgit
    { url = srcUrl;
      rev = srcRev;
      hash = srcHash;
    };

  vendorHash = vendorHash;

  doCheck = false;

  GOAMD64 = "v3";

  ldflags =
    [ "-s" "-w" ];

  installPhase = ''
      install -Dm755 --verbose \
        "$GOPATH/bin/main" "$out/bin/${variant}"
    '';

  inherit meta;

  passthru =
    { inherit variant; };

}
