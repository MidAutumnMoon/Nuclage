final: prev:

{

  k380-function-key-conf =
    final.callPackage ./utils/keyboard/k380-function-key-conf { };

  k380-auto-fn-udev =
    final.callPackage ./utils/keyboard/k380-auto-fn-udev { };

  prime-offload =
    final.callPackage ./utils/prime-offload { };

}
