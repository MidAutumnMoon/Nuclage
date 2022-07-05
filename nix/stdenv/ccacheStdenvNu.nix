{ ccacheStdenv }:

#
# Preconfigured ccache
#

ccacheStdenv.override {
  extraConfig = ''
    export CCACHE_COMPRESS=1
    export CCACHE_DIR=/var/cache/ccache
    export CCACHE_UMASK=007
    '';
  }