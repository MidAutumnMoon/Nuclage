final: prev:

{

  #
  # Utils: tools that nobody cares about
  #

  k380-function-key-conf =
    prev.callPackage ./utils/keyboard/k380-function-key-conf { };

  k380-auto-fn-udev =
    prev.callPackage ./utils/keyboard/k380-auto-fn-udev { };

  prime-offload =
    prev.callPackage ./utils/prime-offload { };



  #
  # Editor: smart editors right to hurt you
  #

  vimPlugins =
    prev.vimPlugins.extend ( prev.callPackage ./editor/vim/vim-plugins { } );

  neovim-numinus =
    prev.callPackage ./editor/neovim/numinus { };



  #
  # Themes: designs whose colors and shapes are insane and weird
  #

  graphite-cursor-theme =
    prev.callPackage ./themes/cursors/graphite-cursor-theme { };



  #
  # Fonts: there's no symbol more beautiful than a whitespace
  #
  comic-mono =
    prev.callPackage ./fonts/comic-mono { };



  #
  # Custom: custom builds of packages others should abs not use
  #

  chromium-teapot =
    prev.callPackage ./custom/browsers/chromium { };

  firefox-teapot =
    prev.callPackage ./custom/browsers/firefox { };



  #
  # Temporary: in another word it's permanent
  #

}
