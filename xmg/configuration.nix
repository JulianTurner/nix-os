{ config, pkgs, ... }:

{
  # XMG-specific configurations
  # networking.hostName = "xmg-core";

  imports = [
    ./gpu.nix
  ];
}
