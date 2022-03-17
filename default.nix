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

  systemd-teapot =
    prev.callPackage ./custom/systemd { inherit (prev) systemd; };



  #
  # Temporary: in another word it's permanent
  #

  # See
  #   - https://github.com/NixOS/nixpkgs/pull/163886
  #   - https://github.com/NixOS/nixpkgs/pull/163904
  #
  # It was reverted in nixpkgs because of the build failure on aarch64.
  fish = prev.fish.overrideAttrs (oldAttrs:
    {
      version = "3.4.0";
      src = final.fetchurl
        {
          url = "https://github.com/fish-shell/fish-shell/releases/download/3.4.0/fish-3.4.0.tar.xz";
          sha256 = "sha256-tbSKuEhrGe9xajL39GuIuepTVhVfDpZ+6Z9Ak2RUE8U=";
        };
      patches = [ ];
    });

}
