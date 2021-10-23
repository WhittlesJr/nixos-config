# TODO: This will need to change, for different installations of NixOS.

# Note: This file is modified from one generated by `nixos-generate-config`.

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "rpool_r3hk5z/nixos/ROOT/default";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/boot" =
    { device = "bpool_r3hk5z/nixos/BOOT/default";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/home" =
    { device = "rpool_r3hk5z/nixos/DATA/default/home";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/root" =
    { device = "rpool_r3hk5z/nixos/DATA/default/root";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/srv" =
    { device = "rpool_r3hk5z/nixos/DATA/default/srv";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/usr/local" =
    { device = "rpool_r3hk5z/nixos/DATA/default/usr/local";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/log" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/log";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/spool" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/spool";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/nix" =
    { device = "rpool_r3hk5z/nixos/DATA/local/nix";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/state" =
    { device = "rpool_r3hk5z/nixos/DATA/default/state";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/etc/nixos" =
    { device = "/state/etc/nixos";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/etc/cryptkey.d" =
    { device = "/state/etc/cryptkey.d";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/boot/efis/nvme-eui.88924e98b5be4a48bb0b501f0cfd5cc9-part1" =
    { device = "/dev/disk/by-uuid/0743-30A3";
      fsType = "vfat"; options = [ "x-systemd.idle-timeout=1min" "x-systemd.automount" "noauto" ];
    };

  fileSystems."/boot/efis/nvme-eui.d3e81d22e1499541aea81b4fa99b2d8c-part1" =
    { device = "/dev/disk/by-uuid/0744-A902";
      fsType = "vfat"; options = [ "x-systemd.idle-timeout=1min" "x-systemd.automount" "noauto" ];
    };

  fileSystems."/var/games" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/games";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/www" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/www";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/lib/AccountsService" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/lib/AccountsService";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/lib/docker" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/lib/docker";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/lib/nfs" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/lib/nfs";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/lib/lxc" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/lib/lxc";
      fsType = "zfs"; options = [ "zfsutil" ];
    };

  fileSystems."/var/lib/libvirt" =
    { device = "rpool_r3hk5z/nixos/DATA/default/var/lib/libvirt";
      fsType = "zfs"; options = [ "zfsutil" ];
    };


  # TODO: Not for real install.
  virtualisation.virtualbox.guest.enable = true;
}
