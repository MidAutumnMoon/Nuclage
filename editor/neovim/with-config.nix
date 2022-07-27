{ fetchFromGitHub, runCommandNoCC
, neovim-teapot
}:

let

  src = fetchFromGitHub
    { owner = "MidAutumnMoon";
      repo = "Numinus";
      rev = "e23ed0558cdbce7db3aee71faccab476f40820ba";
      sha256 = "TOyzBgdLJDMSf66kNXKYGReE719ujkLx86EM8Zqe+Go=";
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
      cat "$src/plugin/RememberPosition.lua" >> "$out/conf.lua"
      cat "$src/plugin/Whitespace.lua" >> "$out/conf.lua"

      cat "${./Statusline.vim}" >> "$out/conf.vim"
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
