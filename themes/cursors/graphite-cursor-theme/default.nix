{ lib, runCommand, stdenvNoCC, fetchFromGitHub }:

let

  src = fetchFromGitHub
    { owner = "vinceliuice";
      repo = "Graphite-cursors";
      rev = "8773e95b6e2cf7784f2a64d052f82ad5cc342668";
      sha256 = "abnCIoPTbhyeWVBLiNjBI2+/6IIQ6I6lS/rvoVrselY=";
    };

  buildEnvs =
    { inherit src;
      pname = "graphite-cursor-theme";
      version = "unstable";
      meta =
        { homepage = "https://github.com/vinceliuice/Graphite-cursors";
          license = lib.licenses.gpl3;
        };
    };

  buildCommand = ''
      installDir="$out/share/icons"
      mkdir -p "$installDir"

      cp -rv "$src/dist-light"      "$installDir/Graphite-light-cursors"
      cp -rv "$src/dist-dark"       "$installDir/Graphite-dark-cursors"
      cp -rv "$src/dist-light-nord" "$installDir/Graphite-light-nord-cursors"
      cp -rv "$src/dist-dark-nord"  "$installDir/Graphite-dark-nord-cursors"
    '';

in

runCommand buildEnvs.pname buildEnvs buildCommand
