let
  config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      darwin = pkgs.darwin // mydarwin;
      jenv = with pkgs; import ./tools/misc/jenv { inherit stdenv fetchurl makeWrapper; };
      glibtool = with pkgs; import ./development/tools/misc/glibtool { inherit stdenv fetchurl m4 perl help2man; };
    };
  };

  mydarwin = import ./darwin { inherit pkgs; };

  pkgs = import <nixpkgs> { inherit config; };
in
pkgs

