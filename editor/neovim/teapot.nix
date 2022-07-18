{ lib, wrapNeovim , neovim-unwrapped
, extraTools ? [ ]
, customRC ? null
}:

# "wrapNeovim" is the marked as the "legacy" wrapper,
# but it uses the new "wrapNeovimUnstable" under
# the hood and its interface is much more cleaner
# than the makeNeovimConfig + wrapNeovimUnstable
# combination.
#
# What the h :(

let

  # Walkaround of an unexpected undefined
  # behavior of the wrapper.
  customRCAttrs =
    if customRC != null
    then { configure = { inherit customRC; }; }
    else {};

  wrapperArguments =
    { extraName = "-numinus";

      withRuby = false;
      withNodeJs = false;
      withPython3 = false;

      vimAlias = true;
      viAlias = true;

      extraMakeWrapperArgs = ''
          --set XDG_DATA_DIRS '${xdgDataDirs}' \
          --set XDG_CONFIG_DIRS '${xdgConfigDirs}' \
          --prefix PATH ':' '${lib.makeBinPath extraTools}'
        '';
    } // customRCAttrs;

  xdgDataDirs = builtins.concatStringsSep ":"
    [ "/nix/var/nix/profiles/default/share"
      "/run/current-system/sw/share"
    ];

  xdgConfigDirs = builtins.concatStringsSep ":"
    [ "/etc/xdg"
      "/nix/var/nix/profiles/default/etc/xdg"
      "/run/current-system/sw/etc/xdg"
    ];

in

wrapNeovim neovim-unwrapped wrapperArguments
