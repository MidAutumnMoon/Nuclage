let

  flake =
    builtins.getFlake "${toString ./.}";

in

with flake.packages."x86_64-linux";

{

  # Huge and heavy packages,
  # may should build them on by one?

  kernels-modules =
    [
      linuxPackages_zen.kernel
      linuxPackages_zen.zfs
    ];

  sequential =
    [
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
