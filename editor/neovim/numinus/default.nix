{
  lib, wrapNeovim
,
  neovim-unwrapped
,
  # add these packages to
  # the wrapper's PATH
  otherTools ? [ ]
,
  #
  customRC ? null
}:

# "wrapNeovim" is the marked as the "legacy" wrapper,
# but it uses the new "wrapNeovimUnstable" under
# the hood and its interface is much more cleaner
# than the makeNeovimConfig + wrapNeovimUnstable
# combination.
#
# What the .... :(

wrapNeovim neovim-unwrapped (
  {
    extraName = "-numinus";

    withRuby = false;
    withNodeJs = false;
    withPython3 = false;

    vimAlias = true;
    viAlias = true;

    extraMakeWrapperArgs =
      ''
        --prefix "PATH" ":" "${lib.makeBinPath otherTools}"
      '';
  }
    //
  ( if customRC == null
    then {  }
    else { configure.customRC = customRC; }
  )
)
