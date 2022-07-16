{ stdenv, fetchFromGitHub }:

let

  rev =
    "153ff9acb7ad63717a50bb26cd5aaa053870c666";

  sha256 =
    "PmtIHX+Pd4QJPBfYwg345qSDFvIyVroZaRXltE6a52s=";

  zuoRoot =
    "racket/src/zuo";

in

stdenv.mkDerivation {

  pname = "zuo";
  version = "unstable";

  src = fetchFromGitHub
    { inherit rev sha256;
      owner = "racket";
      repo = "racket";
    };

  # Is there an alternative method?
  sourceRoot =
    "/build/source/${zuoRoot}";

}
