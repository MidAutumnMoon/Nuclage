{ lib, fetchFromGitHub, rustPlatform }:

let

  srcRev =
    "c5f7caab8d7a800e5a6a16fe6588b11c710a0140";

  srcHash =
    "sha256-keLyPi7LwA3KBHY9M75BRvivXMfQoVmzYj+R6vYN2BI=";

  cargoSha256 =
    "sha256-GAW/3uOD5+xkP8X51gGdUCvopWStPX5AHamcg5N4JoM=";

in

rustPlatform.buildRustPackage rec {

  pname = "shadowsocks-rust";
  version = "unstable";

  src = fetchFromGitHub
    { owner = "shadowsocks";
      repo = pname;
      rev = srcRev;
      sha256 = srcHash;
    };

  inherit
    cargoSha256;


  doCheck = false;

  CARGO_PROFILE_RELEASE_LTO = "thin";

  RUSTFLAGS =
    "-C target-cpu=x86-64-v3 -C opt-level=3";

  buildNoDefaultFeatures =
    true;

  buildFeatures =
    [ "local"
      "server"
      "trust-dns"
      "dns-over-tls"
      "dns-over-https"
      "local-http"
      "mimalloc"
      "multi-threaded"
      "aead-cipher-2022"
      "logging"
      "security-replay-attack-detect"
      "security-iv-printable-prefix"
    ];

  meta =
    { homepage = "https://github.com/shadowsocks/shadowsocks-rust";
      license = lib.licenses.mit;
    };

}

