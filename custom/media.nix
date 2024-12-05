{ lib, config, pkgs, ... }:
with lib;
{
  options.my = {
    role.mediaArchival = mkEnableOption "Managing and archiving A/V media";
  };
  config = mkIf config.my.role.mediaArchival {
    environment.systemPackages = with pkgs; [
      whipper     # CD ripping
      audacity    # Audio recording and editing
      makemkv     # Blu-ray / DVD ripping
      mkvtoolnix  # Creating / editing mkv
      ccextractor # For makemkv
      picard      # Music library management
      handbrake   # Video compression
      android-file-transfer

      (appimage-run.override {
        extraPkgs = pkgs: [ pkgs.libthai ];
      })
      audible-cli
    ];
  };
}
