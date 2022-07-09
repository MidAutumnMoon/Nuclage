{ runCommand, makeWrapper
, v2ray-domain-list-community
, v2ray-geoip
, v2ray-core ? null
}:

let

  pname =
    "v2ray-${v2ray-core.version}";

  cmdArgs =
    { nativeBuildInputs =
        [ makeWrapper ];
      meta =
        v2ray-core.meta;
    };

  buildCmd = ''
      mkdir -p "$out"

      # Copy assets

      cp --recursive --verbose --no-preserve=all \
        "${v2ray-domain-list-community}"/* \
        "${v2ray-geoip}"/* \
        "$out"

      # Copy core executables

      cp --recursive --verbose --no-preserve=all \
        "${v2ray-core}"/* \
        "$out/old-bin"

      # Wrap executables

      mkdir -p "$out/bin"

      for file in "$out/old-bin"/*
      do
        chmod a+x "$file"
        makeWrapper "$file" "$out/bin/$(basename $file)" \
          --set-default V2RAY_LOCATION_ASSET "${placeholder "out"}/share/v2ray"
      done
    '';

in

assert v2ray-core != null;

runCommand pname cmdArgs buildCmd
