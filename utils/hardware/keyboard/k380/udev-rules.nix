{ lib, runCommandLocal, writeShellScript
, k380-fn-keys-swap
}:

let

  autoSwapScript = writeShellScript "k380-fn-keys-auto-swap" ''
      DEVICE="$(ls -l /sys/class/hidraw | grep 046D:B342 | grep -o 'hidraw[0-9]*$')"

      if test -n "$DEVICE" && (test -z "$1" || test "/dev/$DEVICE" = "$1"); then
        echo "Found K380 keyboard at $DEVICE."
        exec "${lib.getExe k380-fn-keys-swap}" -d "/dev/$DEVICE" -f "on"
      fi
    '';

  udevRule = ''
      ACTION=="add", KERNEL=="hidraw[0-9]*", RUN+="${autoSwapScript} /dev/%k"
    '';

  buildEnv =
    { pname = "k380-fn-keys-swap-udev";
      version = "dev";
      inherit udevRule;
      passAsFile = [ "udevRule" ];
    };

  buildCommand = ''
      install -Dm644 \
        "$udevRulePath" "$out/lib/udev/rules.d/60-k380-auto-fn-swap.rules"
    '';

in

runCommandLocal buildEnv.pname buildEnv buildCommand
