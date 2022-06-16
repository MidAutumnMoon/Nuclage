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

  # TODO: rewrite an alternative
  git-crypt =
    callPackage ./utils/git/git-crypt { inherit (prev) git-crypt; };



  #
  # Editor: smart editors right to hurt you
  #

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



  #
  # Temporary: in another word it's permanent
  #



  #
  # Break: the only good thing above all sections
  #

  plasma5Packages =
    callPackage ./break/plasma5-packages { inherit (prev) plasma5Packages; };

}
