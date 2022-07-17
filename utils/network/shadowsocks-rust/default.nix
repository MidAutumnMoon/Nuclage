{ lib, fetchFromGitHub, rustPlatform }:

let

  srcRev =
    "f8a957bcd4a9b375bf4f4e872d534ebeff9db96c";

  srcHash =
    "hRfvh94GZjQh5bt7piXXUEWlQOLHVJuji4M4zhmY+dw=";

  cargoSha256 =
    "sha256-i8LRt21yR/3NgV9yz1FfW8ZDcnwrZBDaFz1PgXeofxs=";

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
    "-C target-cpu=x86-64-v2 -C opt-level=3";

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

