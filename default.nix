final: prev:

let

  callPackage = final.callPackage;

in

{

  #
  # Utils: tools that nobody cares about
  #

  k380-function-key-conf =
    callPackage ./utils/keyboard/k380-function-key-conf { };

  k380-auto-fn-udev =
    callPackage ./utils/keyboard/k380-auto-fn-udev { };

  prime-offload =
    callPackage ./utils/prime-offload { };



  #
  # Editor: smart editors right to hurt you
  #

  neovim-numinus =
    callPackage ./editor/neovim/numinus { };



  #
  # Themes: designs whose colors and shapes are insane and weird
  #

  graphite-cursor-theme =
    callPackage ./themes/cursors/graphite-cursor-theme { };



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



  #
  # Temporary: in another word it's permanent
  #



  #
  # Break: the only good thing above all sections
  #

  plasma5Packages =
    callPackage ./break/plasma5-packages { inherit (prev) plasma5Packages; };

}
