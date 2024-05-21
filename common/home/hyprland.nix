{ config, pkgs, ... }:

let
  terminal = "kitty";
  fileManager = "dolphin";
  webBrowser = "firefox";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    settings = {
      ################
      ### MONITORS ###
      ################

      "monitor" = ",preferred,auto,1";
      # "monitor" = ",highres,auto,2";

      xwayland = {
        force_zero_scaling = true;
      };

      # toolkit-specific scale
      "env" = [

        "GDK_SCALE,2"
        "XCURSOR_SIZE,32"
      ];


      #################
      ### AUTOSTART ###
      #################

      "exec-once" = [
        "${terminal}"
        "waybar"
      ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################


      #####################
      ### LOOK AND FEEL ###
      #####################

      #############
      ### INPUT ###
      #############

      ####################
      ### KEYBINDINGS ###
      ####################

      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, ${webBrowser}"
          "$mod, Q, exec, ${terminal}"
          "$mod, C, killactive"
          "$mod, M, exit"
          "$mod, E, exec, ${fileManager}"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList
            (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };

  };
}

