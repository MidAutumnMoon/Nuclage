{ fetchFromGitHub, runCommandNoCC
, neovim-teapot
}:

let

  src = fetchFromGitHub
    { owner = "MidAutumnMoon";
      repo = "Numinus";
      rev = "2120aec11dc5d1c3c3fce417eb47a9b585772346";
      sha256 = "2uf6s6/3Tus3rACdiYxyFiFmhxRzr9H66FAVgHrNDfw=";
    };

  extractedConfig = runCommandNoCC "neovim-config" { inherit src; } ''
      mkdir -p "$out"

      for file in $src/startup/*.vim; do
        cat "$file" >> "$out/conf.vim"
      done

      for file in $src/startup/*.lua; do
        cat "$file" >> "$out/conf.lua"
      done
    '';

in

neovim-teapot.override {

  customRC = ''
      let mapleader = " "
      let maplocalleader = "\\\\"

      let g:do_filetype_lua = 1
      let g:did_load_filetypes = 0

      source ${extractedConfig}/conf.vim
      source ${extractedConfig}/conf.lua
    '';

}
