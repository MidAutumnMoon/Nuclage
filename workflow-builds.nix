let

  flake =
    builtins.getFlake "${toString ./.}";

in

with flake.packages."x86_64-linux";

{

  # Huge and heavy packages,
  # may should build them on by one?

  kernels-modules =
    [ linuxPackages_zen-teapot.kernel.all
      linuxPackages_zen-teapot.zfs
      linuxPackages_zen-teapot.nvidiaPackages.stable.all
    ];

  sequential =
    [ ];


  # Small and lightweight packages,
  # do them altogether.

  parallel =
    [ shadowsocks-rust
      git-crypt
      v2ray
      xray
      neovim-teapot
    ];

}
