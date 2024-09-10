{ lib, config, pkgs, ... }:
with lib;
let
  inkscape = pkgs.inkscape-with-extensions.override {
    inkscapeExtensions = [
      pkgs.inkscape-extensions.inkcut
      pkgs.inkscape-extensions.silhouette
    ];
  };
in
{
  options.my = {
    role.textileDesign = mkEnableOption "Working with textile patterns and sewing";
  };
  config = mkIf config.my.role.textileDesign {
    environment.systemPackages = with pkgs; [
      inkscape
      seamly2d
      posterazor
    ];

    fonts.packages = with pkgs; [
      clearlyU
    ];
  };
}
