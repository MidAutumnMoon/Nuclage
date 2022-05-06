{ stdenv, fetchFromGitHub, ... }:

let

  rev =
    "c9b96077d914fadb7242966a1fbb64746086a90e";

  sha256 =
    "sha256-LkdX/OAr/DViYWX+2dIAICc8LMaJ+OVvRglzjNwmPhY=";

  zuoRoot =
    "racket/src/zuo";

in

stdenv.mkDerivation ( drvSelf: {

  pname = "zuo";
  version = "unstable";

  src = fetchFromGitHub
    { inherit rev sha256;
      owner = "racket";
      repo = "racket";
      sparseCheckout = zuoRoot;
    };

  # Is there an alternative method?
  sourceRoot =
    "/build/source/${zuoRoot}";

} )
