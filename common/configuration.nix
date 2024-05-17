# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./sound.nix
      ./hyprland.nix
      ./obsidian.nix
      ./steam.nix
      ./kde.nix
      ./localization.nix
      ./connections.nix
      ./virtualisation.nix
      ./users/configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      julian = import ./home/configuration.nix;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # security.polkit.enable = true;

  # systemd = {
  #   user.services.polkit-gnome-authentication-agent-1 = {
  #     description = "polkit-gnome-authentication-agent-1";
  #     wantedBy = [ "graphical-session.target" ];
  #     wants = [ "graphical-session.target" ];
  #     after = [ "graphical-session.target" ];
  #     serviceConfig = {
  #       Type = "simple";
  #       ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #       Restart = "on-failure";
  #       RestartSec = 1;
  #       TimeoutStopSec = 10;
  #     };
  #   };
  # };


  # Desktopportals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    # pkgs.xdg-desktop-portal-hyprland 
    # pkgs.xdg-desktop-portal-kde 
    pkgs.xdg-desktop-portal-gnome
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # security.pam.services.kwallet = {
  #   name = "kwallet";
  #   enableKwallet = true;
  # };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];


  services.onedrive.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;



  programs.zsh.enable = true;
  programs.chromium.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    home-manager
    git
    nodejs
    neovim
    xwaylandvideobridge
    toybox
    xorg.xhost
    vimPlugins.LazyVim
    gcc
    #avahi
    # zsh
  ];

  systemd.services.set-xhost = {
    description = "Set xhost permissions";
    after = [ "display-manager.service" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.xorg.xhost}/bin/xhost +local:";
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };

  # users.defaultUserShell = pkgs.zsh;
  # environment.shells = with pkgs; [ zsh ];

  #services.avahi.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
