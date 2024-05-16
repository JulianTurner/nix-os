{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Julian Turner";
    userEmail = "julian@trner.de";
    # includes = [
    #   { path = "~/.gitconfig.local"; }
    # ];
  };
}
