{ lib, wrapNeovim , neovim-unwrapped
# TODO: rename
, otherTools ? [ ]
, customRC ? null
}:

# "wrapNeovim" is the marked as the "legacy" wrapper,
# but it uses the new "wrapNeovimUnstable" under
# the hood and its interface is much more cleaner
# than the makeNeovimConfig + wrapNeovimUnstable
# combination.
#
# What the .... :(

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
          --prefix PATH ':' '${lib.makeBinPath otherTools}'
        '';
    } // customRCAttrs;

in

wrapNeovim neovim-unwrapped wrapperArguments
