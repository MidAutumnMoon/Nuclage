{ runCommand, fetchFromGitHub }:

let

  src = fetchFromGitHub
    {
      owner = "dtinth";
      repo = "comic-mono-font";
      rev = "9a96d04cdd2919964169192e7d9de5012ef66de4";
      sha256 = "q8NxrluWuH23FfRlntIS0MDdl3TkkGE7umcU2plS6eU=";
    };

in

runCommand "ttf-comic-mono"
  {
    inherit src;
  }
  ''
    mkdir -p $out/share/fonts/truetype
    cp $src/ComicMono*.ttf -t $out/share/fonts/truetype
  ''

