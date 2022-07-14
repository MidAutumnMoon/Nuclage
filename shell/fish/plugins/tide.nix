{ buildFishPlugin, fetchFromGitHub }:

let

  version =
    "5.3.0";

  hash =
    "sha256-/r+vaJIQ+yi7YDN7AThRKWDimdDuVmeYcg7t0GzebZE=";

in

buildFishPlugin {

  pname = "tide";
  version = "v${version}";

  src = fetchFromGitHub
    { owner = "IlanCosman";
      repo = "tide";
      rev = "v${version}";
      inherit hash;
    };

  fixupPhase = ''
      cp --verbose --recursive \
        'functions/tide' "$out/share/fish/vendor_functions.d"
    '';

}
