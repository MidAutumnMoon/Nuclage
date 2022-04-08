{
  callPackage
, fetchFromGitHub
, vimUtils
,
}:

self: super: {


  # The original vim-racket has not been
  # updated for half a year.
  #
  # So use this fork.
  # https://github.com/benknoble/vim-racket
  #
  "vim-racket" = super."vim-racket".overrideAttrs (oldAttrs:
    {
      version = "unstable";
      src = fetchFromGitHub
        {
          owner = "benknoble";
          repo = "vim-racket";
          rev = "4decaa461039075fe012925f3bc8f3e81f7720a4";
          sha256 = "gaR6yscKE4HtH1hcacCszwfJY2MEv/kLkUy5FH5qYag=";
        };
      meta.homepage =
        "https://github.com/benknoble/vim-racket";
    });


  # filetype.nvim
  #
  # https://github.com/nathom/filetype.nvim
  #
  "filetype-nvim" = vimUtils.buildVimPlugin
    {
      pname = "filetype-nvim";
      version = "v0.4";

      src = fetchFromGitHub
        {
          owner  = "nathom";
          repo   = "filetype.nvim";
          rev    = "25b5f7e5314d5e7739be726860253c67f7e513bf";
          sha256 = "UjLD3CGlrW43WMiIISFkd59GpsZLRo8WzoS2hD2rX+I=";
        };
    };


  # The custom treesitter
  #
  nvim-treesitter-teapot =
    callPackage ./treesitter-teapot.nix { };

}
