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
    prev.vimPlugins.extend (prev.callPackage ./editor/vim/vim-plugins { });



  #
  # Themes: designs whose colors and shapes are insane and weird
  #

  graphite-cursor-theme =
    prev.callPackage ./themes/cursors/graphite-cursor-theme { };



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
