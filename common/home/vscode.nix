{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      esbenp.prettier-vscode
      github.copilot
      github.copilot-chat
      ms-vscode-remote.remote-containers
    ];
  };
}
