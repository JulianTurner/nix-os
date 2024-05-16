{ inputs, config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.julian = {
    isNormalUser = true;
    description = "Julian";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      discord
      # kitty
      neovim
      bitwarden-cli
      jetbrains-toolbox
      libreoffice-fresh
      lutris
      gimp
      chromium
      # gnome-network-displays
    ];
  };
}
