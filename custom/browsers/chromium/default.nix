{ chromium }:

chromium.override {

  commandLineArgs = builtins.concatStringsSep " "
    [

      "--proxy-server='socks5://127.0.0.1:1081'"

      # Fully use socks remote DNS
      #
      # Ref: https://www.chromium.org/developers/design-documents/network-stack/socks-proxy/
      #
      "--host-resolver-rules='MAP * ~NOTFOUND , EXCLUDE 127.0.0.1'"

    ];

}

