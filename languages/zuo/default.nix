{ stdenv, fetchFromGitHub }:

let

  rev =
    "779e58d6ccfb9a17487926fab864b3f88a020482";

  hash =
    "sha256-Vg8azsou161Jxrp7u3XYJyJnC8GZjgbdDrPJXSKR8QE=";

  zuoRoot =
    "racket/src/zuo";

in

stdenv.mkDerivation {

  pname = "zuo";
  version = "unstable";

  src = fetchFromGitHub
    { inherit rev hash;
      owner = "racket";
      repo = "racket";
    };

  # Is there an alternative method?
  sourceRoot =
    "/build/source/${zuoRoot}";

}
