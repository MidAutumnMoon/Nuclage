{ lib, fetchFromGitHub, rustPlatform }:

let

  version =
    "1.15.0-alpha.5";

  hash =
    "sha256-iXidM82WcWbQZGwElgt+ewba2pdDhGe7ez8+fqolff8=";

  cargoHash =
    "sha256-C3lxbhn4IqrpxO/dB1/8u6esArdem3B/M2+/jaTtQbo=";

in

rustPlatform.buildRustPackage rec {

  inherit version;
  pname = "shadowsocks-rust";

  src = fetchFromGitHub
    { owner = "shadowsocks";
      repo = pname;
      rev = "v${version}";
      inherit hash;
    };

  inherit
    cargoHash;


  doCheck = false;

  CARGO_PROFILE_RELEASE_LTO = "thin";

  RUSTFLAGS =
    "-C target-cpu=x86-64-v3";

  buildNoDefaultFeatures =
    true;

  buildFeatures =
    [ "local"
      "server"
      "trust-dns"
      "dns-over-https"
      "local-http"
      "rpmalloc"
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

