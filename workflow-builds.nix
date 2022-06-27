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
      linuxPackages_zen.kernel
      linuxPackages_zen.zfs
    ];


  # Small and lightweight packages,
  # do them altogether.

  parallel =
    [
      shadowsocks-rust
      git-crypt
      zuo
    ];

}
