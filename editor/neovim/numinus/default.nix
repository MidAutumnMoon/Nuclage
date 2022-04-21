{
  wrapNeovimUnstable
, neovimUtils
,
  neovim-unwrapped
, lib
,
  # add these packages' bin/
  # to Neovim's PATH
  otherTools ? [ ]
}:

let

  otherToolPaths =
    lib.makeBinPath otherTools;

  neovim_config = neovimUtils.makeNeovimConfig
    {
      withPython3 = false;
      withRuby = false;
    };

in

wrapNeovimUnstable neovim-unwrapped
  (
    neovim_config
      //
    {
      extraName = "-numinus";
      wrapRc = false;

      wrapperArgs =
        neovim_config.wrapperArgs
          ++
        [
          "--prefix" "PATH" ":" otherToolPaths
        ];
    }
  )


