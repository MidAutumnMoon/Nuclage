{
  lib, stdenvNoCC, writeShellScript
,
  k380-function-key-conf
,
}:

let

  k380ConfTool =
    "${k380-function-key-conf}/bin/k380_conf";


  autoSwapFnKeyScript = writeShellScript "k380-auto-fn" ''
      DEVICE="$(ls -l /sys/class/hidraw | grep 046D:B342 | grep -o 'hidraw[0-9]*$')"

      if test -n "$DEVICE" && (test -z "$1" || test "/dev/$DEVICE" = "$1")
      then
        echo "Found K380 keyboard at $DEVICE."
        exec "${k380ConfTool}" -d "/dev/$DEVICE" -f "on"
      fi
    '';

  udevRule = ''
      ACTION=="add", KERNEL=="hidraw[0-9]*", RUN+="${autoSwapFnKeyScript} /dev/%k"
    '';

in

stdenvNoCC.mkDerivation {

  pname = "k380-auto-fn-udev";
  version = "0.1";

  preferLocalBuild = true;


  passAsFile = [ "udevRule" ];

  inherit udevRule;


  phases = [ "installPhase" ];

  installPhase = ''
      install -Dm644 \
        $udevRulePath $out/lib/udev/rules.d/60-k380-auto-fn.rules
    '';


  meta =
    { homepage = "https://github.com/jergusg/k380-function-keys-conf/";
      description = "Udev rules for auto swapping function keys when K380 keyboards connected";
      license = lib.licenses.gpl3;
    };

}
