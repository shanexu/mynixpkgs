let
  config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      darwin = pkgs.darwin // mydarwin;
      jenv = with pkgs; import ./tools/misc/jenv { inherit stdenv fetchurl makeWrapper; };
    };
  };

  mydarwin = import ./darwin { inherit pkgs; };

  pkgs = import <nixpkgs> { inherit config; };
in
pkgs

