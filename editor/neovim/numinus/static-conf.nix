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
      rev = "4b2e13d356cfbcdac23d6fa3e9c7d88adc761874";
      sha256 = "SOhB1jVziANOlCEv5wlqulK6BQHxuh3iWL7grtFx0XI=";
    };

  basic_configs = runCommandNoCC "numinus-conf" {}
    ''
      mkdir -p "$out"

      for file in ${numinus_src}/startup/*.vim; do
        cat "$file" >> "$out/conf.vim"
      done

      for file in ${numinus_src}/startup/*.lua; do
        cat "$file" >> "$out/conf.lua"
      done
    '';

in

neovim-numinus.override {

  customRC =
    ''
      let mapleader = " "
      let maplocalleader = ",,"

      let g:do_filetype_lua = 1
      let g:did_load_filetypes = 0

      source ${basic_configs}/conf.vim
      source ${basic_configs}/conf.lua
    '';

}
