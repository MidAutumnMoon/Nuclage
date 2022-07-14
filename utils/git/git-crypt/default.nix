{ git-crypt }:

git-crypt.overrideAttrs ( oldAttrs: {

  patches =
    [ # https://github.com/AGWA/git-crypt/pull/180
      ./01-merge-driver.patch
    ];

} )
