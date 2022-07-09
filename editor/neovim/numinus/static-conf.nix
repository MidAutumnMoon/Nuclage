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
      rev = "2120aec11dc5d1c3c3fce417eb47a9b585772346";
      sha256 = "2uf6s6/3Tus3rACdiYxyFiFmhxRzr9H66FAVgHrNDfw=";
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
      let maplocalleader = "\\\\"

      let g:do_filetype_lua = 1
      let g:did_load_filetypes = 0

      source ${basic_configs}/conf.vim
      source ${basic_configs}/conf.lua
    '';

}
