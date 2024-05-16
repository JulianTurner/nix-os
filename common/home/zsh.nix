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

    # shellAliases = {
    #   ll = "ls -l";
    #   update = "sudo nixos-rebuild switch";
    # };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
