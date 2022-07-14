{ lib }:

final: prev:

let

  callPackage =
    final.newScope { inherit lib; };

in

{

  #
  # Utils: tools that nobody cares about
  #

    # Hardwares

    # TODO: rename
    k380-function-key-conf =
      callPackage ./utils/hardware/keyboard/k380-function-key-conf { };

    k380-auto-fn-udev =
      callPackage ./utils/hardware/keyboard/k380-auto-fn-udev { };

    # Some scripts

    prime-offload =
      callPackage ./utils/scripts/prime-offload { };

    # Networking

    shadowsocks-rust =
      callPackage ./utils/network/shadowsocks-rust {  };

    v2ray-core-teapot =
      callPackage ./utils/network/v2ray/core.nix {  };

    v2ray =
      callPackage ./utils/network/v2ray { core = final.v2ray-core-teapot; };

    # Something else

    git-crypt =
      callPackage ./utils/git/git-crypt { inherit (prev) git-crypt; };



  #
  # Editor: smart editors right to hurt you
  #

  # TODO: rename these
  neovim-numinus =
    callPackage ./editor/neovim/numinus { };

  neovim-numinus-static-conf =
    callPackage ./editor/neovim/numinus/static-conf.nix {  };



  #
  # Languages: a monkey with a typewriter can do express better
  #

  zuo =
    callPackage ./languages/zuo { };



  #
  # Themes: designs whose colors and shapes are insane and weird
  #

  graphite-cursor-theme =
    callPackage ./themes/cursors/graphite-cursor-theme { };



  #
  # Shells: efficient because most GUIs are stupid
  #

  fishPlugins =
    callPackage ./shell/fish/plugins { inherit (prev) fishPlugins; };



  #
  # Fonts: there's no symbol more beautiful than a whitespace
  #

  comic-mono =
    callPackage ./fonts/comic-mono { };



  #
  # Custom: custom builds of packages others should abs not use
  #

  chromium-teapot =
    callPackage ./custom/browsers/chromium { };

  firefox-teapot =
    callPackage ./custom/browsers/firefox { };

  linuxPackages_zen-teapot =
    callPackage ./custom/kernel/zen {  };



  #
  # Temporary: in another word it's permanent
  #


  #
  # Break: the only good thing above all sections
  #

  plasma5Packages =
    callPackage ./break/plasma5-packages { inherit (prev) plasma5Packages; };

}
