{
  fetchFromGitHub, runCommandNoCC
,
  neovim-numinus
}:

#
# A Neovim with bare basic options and keymaps.
#

let

  numinus_src = fetchFromGitHub
    { owner = "MidAutumnMoon";
      repo = "Numinus";
      rev = "9176a8721f8dbf3b561c8dbd7887b171d1c837b5";
      sha256 = "HtPosTxOWQo/KBOiTUVgPsfs1+hLIBBi8Xlkg85UhHw=";
    };

  combined_configs = runCommandNoCC "numinus-conf" {}
    ''
      for file in ${numinus_src}/startup/*.vim
      do
        cat "$file" >> "$out"
      done
    '';

in

neovim-numinus.override {

  customRC =
    ''
      let mapleader = " "
      let maplocalleader = ",,"

      ${builtins.readFile combined_configs}
    '';

}
