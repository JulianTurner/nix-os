{ config, pkgs, ... }:
{
  # Insecure
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0" # Obsidian
  ];

  environment.systemPackages = with pkgs; [
    obsidian
  ];
}
