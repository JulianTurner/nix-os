{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "agnoster";
    };

    initExtra = ''
      # Initialize keychain to manage ssh-agent
      eval "$(keychain --eval --agents ssh id_ed25519)" > /dev/null
    '';



    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake /home/julian/Repos/nix-os/flake.nix#xmg
    ";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}

