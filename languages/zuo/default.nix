{ stdenv, fetchFromGitHub, ... }:

let

  rev =
    "82ca0f76f2e18f242db742991596eb509ce49cc1";

  sha256 =
    "sha256-j+Pg64Y5sxcjMtUkeM4Bjz8XRZiHGRcxhhjWZSV7aB0=";

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
      sparseCheckout =
        zuoRoot;
    };

  # Is there an alternative method?
  sourceRoot =
    "/build/source/${zuoRoot}";

} )
