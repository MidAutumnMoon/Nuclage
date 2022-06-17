{ stdenv, fetchFromGitHub, ... }:

let

  rev =
    "fa746e3bb1be105499a5f80a8b846bf2bc27c826";

  hash =
    "sha256-v/I/RVC1WEm0dW5HGNL36rgWZq7xcchBcOWG3SDTcFU=";

  zuoRoot =
    "racket/src/zuo";

in

stdenv.mkDerivation ( drvSelf: {

  pname = "zuo";
  version = "unstable";

  src = fetchFromGitHub
    { inherit rev hash;
      owner = "racket";
      repo = "racket";
      sparseCheckout =
        zuoRoot;
    };

  # Is there an alternative method?
  sourceRoot =
    "/build/source/${zuoRoot}";

} )
