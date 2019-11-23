{ pkgs }:

rec {
  inherit (pkgs.callPackages ./cltools { } ) Command_Line_Tools_for_Xcode_11_2 Command_Line_Tools_for_Xcode;
  mit-scheme-macos10_15-xcode11_2 = with pkgs; pkgs.callPackages ./development/compilers/mit-scheme {
    texLive = texlive.combine { inherit (texlive) scheme-small; };
    texinfo = texinfo5;
    macosVersion = "10.15";
    xcodeVersion = "11.2";
  };
}
