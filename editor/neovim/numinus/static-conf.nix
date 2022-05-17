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
      rev = "6cef5d2629365a54971544d1dd8c5688bfd1804c";
      sha256 = "6FzPzq9xEjKLRE4FUgSJtqGgKtRCO6ZUrr9okO2TxH0=";
    };

  basic_configs = runCommandNoCC "numinus-conf" {}
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

      source ${basic_configs}
    '';

}
