{ runCommand, makeWrapper
, v2ray-domain-list-community
, v2ray-geoip
, core ? null
}:

let

  pname =
    "v2ray-${core.version}";

  cmdArgs =
    { nativeBuildInputs =
        [ makeWrapper ];
      meta =
        core.meta;
    };

  buildCmd = ''
      mkdir --parent "$out"
      mkdir --parent "$out/bin"

      # Copy assets

      cp --recursive --verbose --no-preserve=all \
        "${v2ray-domain-list-community}"/* \
        "${v2ray-geoip}"/* \
        "$out"

      # Copy core executables

      cp --recursive --verbose --no-preserve=all \
        "${core}"/* \
        "$out/old-bin"

      # Wrap executables

      for file in "$out/old-bin"/*
      do
        chmod a+x "$file"
        makeWrapper "$file" "$out/bin/$(basename $file)" \
          --set-default V2RAY_LOCATION_ASSET "${placeholder "out"}/share/v2ray"
      done
    '';

in

assert core != null;

runCommand pname cmdArgs buildCmd
