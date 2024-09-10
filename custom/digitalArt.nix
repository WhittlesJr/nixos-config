{ lib, config, pkgs, ... }:
with lib;
{
  options.my = {
    role.digitalArt = mkEnableOption "Creating 2D digital artwork";
  };
  config = mkIf config.my.role.digitalArt {
    environment.systemPackages = with pkgs; [
      gimp
    ];

    hardware.opentabletdriver.enable = true;
  };
}
