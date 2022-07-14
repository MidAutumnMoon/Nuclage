{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {

  pname = "k380-fn-keys-swap";
  version = "1.1";

  src = fetchFromGitHub
    { owner = "jergusg";
      repo = "k380-function-keys-conf";
      rev = "v${version}";
      sha256 = "I7Umq1ynKX91s6TFQ1+8o+tJw4Ql+WNvgafLLnsM0E0=";
    };

  installPhase = ''
      mkdir -p $out/bin
      install -Dm755 k380_conf $out/bin
    '';

  meta =
    { homepage = "https://github.com/jergusg/k380-function-keys-conf/";
      description = "Make function keys default on Logitech k380 bluetooth keyboard.";
      license = lib.licenses.gpl3;
      mainProgram = "k380_conf";
    };

}
