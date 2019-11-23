let
  config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      darwin = pkgs.darwin // mydarwin;
    };
  };
  mydarwin = import ./darwin { inherit pkgs; };
  pkgs = import <nixpkgs> { inherit config; };

in
pkgs

