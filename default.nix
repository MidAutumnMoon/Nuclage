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

    k380-fn-keys-swap =
      callPackage ./utils/hardware/keyboard/k380/fn-keys-swap.nix { };

    k380-fn-keys-swap-udev =
      callPackage ./utils/hardware/keyboard/k380/udev-rules.nix {  };

    # Some scripts

    prime-offload =
      callPackage ./utils/scripts/prime-offload { };

    # Networking

    shadowsocks-rust =
      callPackage ./utils/network/shadowsocks-rust {  };

    v2ray-core-teapot =
      callPackage ./utils/network/v2ray/core.nix {  };

    xray-core-teapot =
      callPackage ./utils/network/v2ray/xray.nix {  };

    v2ray =
      callPackage ./utils/network/v2ray/wrapper.nix { core = final.v2ray-core-teapot; };

    xray =
      callPackage ./utils/network/v2ray/wrapper.nix { core = final.xray-core-teapot; };

    # Something else

    git-crypt =
      callPackage ./utils/git/git-crypt { inherit (prev) git-crypt; };



  #
  # Editor: smart editors right to hurt you
  #

  neovim-teapot =
    callPackage ./editor/neovim/teapot.nix {  };

  neovim-teapot-with-config =
    callPackage ./editor/neovim/with-config.nix {  };



  #
  # Languages: a monkey with a typewriter can do express better
  #


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
