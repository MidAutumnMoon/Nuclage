{ fetchFromGitHub, runCommandNoCC
, neovim-teapot
}:

let

  src = fetchFromGitHub
    { owner = "MidAutumnMoon";
      repo = "Numinus";
      rev = "19cef12431497c833b96ab8e7c265ffaa621b6c6";
      sha256 = "clZknosVxx+axQ8eFCZN+TfwttdbAX8lEjTkVq2+6j0=";
    };

  extractScript = ''
      mkdir -p "$out"

      for file in $src/startup/*.vim; do
        cat "$file" >> "$out/conf.vim"
      done

      for file in $src/startup/*.lua; do
        cat "$file" >> "$out/conf.lua"
      done

      cat "$src/plugin/HighlightYank.vim" >> "$out/conf.vim"
      cat "$src/plugin/Statusline.vim" >> "$out/conf.vim"
      cat "$src/plugin/RememberPosition.lua" >> "$out/conf.lua"
      cat "$src/plugin/Whitespace.lua" >> "$out/conf.lua"
    '';

  extractedConfig =
    runCommandNoCC "neovim-config" { inherit src; } extractScript;

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
