let

  flake =
    builtins.getFlake "${toString ./.}";

in

with flake.packages."x86_64-linux";

{

  # Huge and heavy packages,
  # may should build them on by one?

  sequential =
    [
      shadowsocks-rust
    ];


  # Small and lightweight packages,
  # do them altogether.

  parallel =
    [
      git-crypt
      zuo
    ];

}
