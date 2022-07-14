{ firefox }:

let

  # the original firefox with some customizations
  # which is already being wrapped

  newFirefox = firefox.override {
      extraPolicies =
        import ./policies.nix;
      extraPrefs =
        builtins.readFile ./autoconfig.js;
    };


  # ... and wrap it again to:
  #
  # 1) fake a timezone for privacy reasons
  #

  wrappedTwiceFirefox = newFirefox.overrideAttrs ( oldAttrs:
    { buildCommand = ''
          ${oldAttrs.buildCommand}
          mv $out/bin/{firefox,.firefox-old-wrapped}

          makeWrapper $out/bin/{.firefox-old-wrapped,firefox} \
            --set TZ "Asia/Tokyo"
        '';
    } );

in

wrappedTwiceFirefox

