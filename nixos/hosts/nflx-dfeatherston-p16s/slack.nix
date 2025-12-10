{ config, pkgs, ... }:

let
  slack-wayland = pkgs.writeShellScriptBin "slack" ''
    exec ${pkgs.slack}/bin/slack \
      --ozone-platform-hint=auto \
      --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer \
      "$@"
  '';
in
{
  environment.systemPackages = with pkgs; [
    slack-wayland
  ];
}
