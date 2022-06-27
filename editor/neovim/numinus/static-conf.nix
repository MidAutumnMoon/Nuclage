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
      rev = "03190f16d3523e4e8d1c3b13d590e38b40745bf7";
      sha256 = "sha256-nLgJCUw5qn3JqiKxCwz8MwOGmuy2/D5aswlIHJyNV7w=";
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
      let maplocalleader = "\\"

      let g:do_filetype_lua = 1
      let g:did_load_filetypes = 0

      source ${basic_configs}/conf.vim
      source ${basic_configs}/conf.lua
    '';

}
