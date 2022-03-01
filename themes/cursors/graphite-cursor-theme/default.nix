{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {

  pname = "graphite-cursor-theme";
  version = "2021-11-26";


  src = fetchFromGitHub
    {
      owner = "vinceliuice";
      repo = "Graphite-cursors";
      rev = "${version}";
      sha256 = "abnCIoPTbhyeWVBLiNjBI2+/6IIQ6I6lS/rvoVrselY=";
    };


  phases = [ "installPhase" ];

  installPhase =
    let
      DEST = "$out/share/icons";
    in
      ''
        install -dm755 ${DEST}

        cp -r "$src/dist-light"      "${DEST}/Graphite-light-cursors"
        cp -r "$src/dist-dark"       "${DEST}/Graphite-dark-cursors"
        cp -r "$src/dist-light-nord" "${DEST}/Graphite-light-nord-cursors"
        cp -r "$src/dist-dark-nord"  "${DEST}/Graphite-dark-nord-cursors"
      '';


    meta =
      {
        description = "Graphite cursors theme for linux desktops";
        homepage = "https://github.com/vinceliuice/Graphite-cursors";
        license = lib.licenses.gpl3;
        platforms = lib.platforms.all;
      };

}

