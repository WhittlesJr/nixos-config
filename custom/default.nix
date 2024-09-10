{ nodes, lib, config, pkgs, ... }:
with lib;
{
  imports = [
    ./architecture.nix
    ./cloudServer.nix
    ./desktop.nix
    ./development.nix
    ./digitalArt.nix
    ./gaming.nix
    ./media.nix
    ./shapeModeling.nix
    ./synergy.nix
    ./textiles.nix
  ];

  deployment.targetHost = (mkIf is.nixops config.networking.hostName);

  #nix.distributedBuilds = true;
  nix.buildMachines = (mkIf is.nixops
    (mapAttrsToList
      (name: node: {hostName = node.config.networking.hostName;
                    system = "x86_64-linux";
                    maxJobs = node.config.nix.settings.max-jobs;})
      nodes));

  services.journald.extraConfig = "Storage=persistent";
  system.copySystemConfiguration = true;
  services.fwupd.enable = true;
  services.thermald.enable = true;
  systemd.coredump.enable = true;

  boot.kernel.sysctl = {
    "vm.vfs_cache_pressure" = 200;
  };

  environment.systemPackages = with pkgs; [
    # luls
    cowsay
    fortune
    sl

    # Machine management
    nixops_unstable_minimal


    # hardware
    smartmontools

    # common tools
    mkpasswd
    tree
    babashka
  ];

}
