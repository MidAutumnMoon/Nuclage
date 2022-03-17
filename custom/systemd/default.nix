{ systemd }:

let

  customOptions =
    {
      pname = "systemd-teapot";

      withApparmor = false;
      withCryptsetup = false;
      withFido2 = false;
      withHomed = false;
      withTpm2Tss = false;
    };

  overrideFunc =
    oldAttrs:
      {
        # Don't need resolvconf compatibilty
        postFixup =
          ''
            rm $out/bin/resolvconf
          '';
      };

in

(systemd.override customOptions).overrideAttrs overrideFunc

