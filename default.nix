let
  config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      darwin = pkgs.darwin // mydarwin;
      jenv = pkgs.callPackage ./tools/misc/jenv { };
      glibtool = pkgs.callPackage ./development/tools/misc/glibtool { };
      coreutils = pkgs.callPackage ./tools/misc/coreutils { };
      coreutils-conflict-prefixed = coreutils.override { withPrefix = true; singleBinary = false; unprefixNoConflict = true; };
    };
  };

  mydarwin = import ./darwin { inherit pkgs; };

  pkgs = import <nixpkgs> { inherit config; };
in
pkgs

