# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ nodes, stdenv, config, lib, pkgs, callPackage, is, ... }:
with lib;
rec {
  system.stateVersion = "24.11";

  imports = [
    #../../configuration.nix # Comment for nixos-install/rebuild
  ];


  my = {
    zfs = {
      mirrorDrives = [
        "nvme-CT2000T500SSD8_240646EA4ECB"
        "nvme-WD_BLACK_SN850X_HS_2000GB_24120D800169"
      ];
      partitions = {
        legacyBIOS = 1;
        EFI        = 2;
        boot       = 3;
        main       = 4;
        swap       = 5;
      };
      pools = let id = "6cxoeq"; in {
        boot.name = "boot-${id}";
        main.name = "main-${id}";
      };
      usersZvolsForVMs = [
      ];
    };
    intended.netPorts.TCP = [
      24800                 # Synergy
      80 443 8083           # Nginx
      32400 3005 8324 32469 # Plex
    ];
    intended.netPorts.UDP = [
      1900 5353 32410 32412 32413 32414 # Plex
    ];

    role = {
      architecture = false;
      desktop = true;
      development = {
        nix = true;
        clojure = false;
      };
      digitalArt = false;
      gaming = false;
      mediaArchival = false;
      modeling3D = false;
      textileDesign = false;
    };
    services = {
      printing3D = false;
      synergy.server = {
        enable = false;
        serverScreen = "left";
        clientScreen = "right";
        #clientNode = nodes.alex-laptop;
      };
      anki = false;
      calibre = false;
      nextCloud = false;
      plex = false;
      mediaRoot = "/media";
      webDomain = "tmp";
      adminEmail = "tmp";
    };
    allowedUnfree = [
      "nvidia-x11"
      "hplip"
      "plexmediaserver"
      "makemkv"
      "steam-run"
      "steam-original"
      "steam"
      "plexamp"
      "nvidia-settings"
    ];
  };

  hardware.bluetooth.enable = true;

  boot = {
    initrd.availableKernelModules = [
      "ahci"
      "nvme"
      "sd_mod"
      "sr_mod"
      "usb_storage"
      "usbhid"
      "xhci_pci"
    ];

    blacklistedKernelModules = [
      "sp5100-tco" # Suppress a warning at boot. The Asus X570 does not support IPMI.
    ];

    kernelModules = [
      "lm92" # Temp sensors (NVIDIA)
      "sg"   # Blu-ray ODD
    ];
    extraModulePackages = [ ];

    zfs.extraPools = [ "tank" ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = true;
    #package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  nix.settings.max-jobs = 14;
  powerManagement.cpuFreqGovernor = "performance";

}
