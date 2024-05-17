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
      # Start ssh-agent
      eval "$(ssh-agent -s)" > /dev/null
      ssh-add ~/.ssh/id_ed25519 > /dev/null
    '';


    # shellAliases = {
    #   ll = "ls -l";
    #   update = "sudo nixos-rebuild switch";
    # };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
