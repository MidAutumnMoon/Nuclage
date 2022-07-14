{ chromium }:

let

  commandLineArgs = builtins.concatStringsSep " "
    [
      "--proxy-server='socks5://127.0.0.1:1081'"

      # Force socks remote DNS
      # - https://www.chromium.org/developers/design-documents/network-stack/socks-proxy/
      "--host-resolver-rules='MAP * ~NOTFOUND , EXCLUDE 127.0.0.1'"
    ];
in

chromium.override { inherit commandLineArgs; }

