{ lib, config, pkgs, ... }:
with lib;
{
  time.timeZone = "America/New_York";

  # Run the following to get the URI for CUPS:
  # nix run nixpkgs.hplipWithPlugin -c hp-makeuri 192.168.1.124
  services.printing = {
    drivers = [ pkgs.hplipWithPlugin ];
  };

  # Scanning
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

  environment.systemPackages = with pkgs; [
    simple-scan
  ] ++ (optionals is.GUI [
    plexamp
  ]);

  users.groups = { plugdev = {}; };

  services.udev.extraRules = ''
    SUBSYSTEM=="tty", ATTRS{serial}=="0C01300CAF3A81285C6A8321F50020C3", ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="6029", SYMLINK+="ttyEnder3"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="0483", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="0483", TAG+="uaccess"

  '';
}
