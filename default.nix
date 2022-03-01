final: prev:

{

  #
  # Utils: tools that nobody cares about
  #

  k380-function-key-conf =
    final.callPackage ./utils/keyboard/k380-function-key-conf { };

  k380-auto-fn-udev =
    final.callPackage ./utils/keyboard/k380-auto-fn-udev { };

  prime-offload =
    final.callPackage ./utils/prime-offload { };



  #
  # Themes: designs whose colors and shapes are insane and weird
  #

  graphite-cursor-theme =
    final.callPackage ./themes/cursors/graphite-cursor-theme { };



  #
  # Custom: custom builds of packages others should abs not use
  #

  chromium-teapot =
    final.callPackage ./custom/browsers/chromium { };

  firefox-teapot =
    final.callPackage ./custom/browsers/firefox { };

}
