{ callPackage, fetchFromGitHub }:

self: super: {


  # The original vim-racket has not been
  # updated for half a year.
  #
  # So use this fork.
  # https://github.com/benknoble/vim-racket
  #
  "vim-racket" = super."vim-racket".overrideAttrs (oldAttrs:
    {
      version =
        "unstable";
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


}
