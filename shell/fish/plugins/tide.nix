{ lib, buildFishPlugin, fetchFromGitHub }:

let

  version =
    "5.4.0";

  hash =
    "sha256-jswV+M3cNC3QnJxvugk8VRd3cOFmhg5ejLpdo36Lw1g=";

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

  meta =
    { homepage = "https://github.com/IlanCosman/tide";
      license = lib.licenses.mit;
      description = "The ultimate Fish prompt.";
    };

}
