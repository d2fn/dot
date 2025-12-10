{ config, pkgs, ... }:

let
  obsidian-wayland = pkgs.writeShellScriptBin "obsidian" ''
    exec ${pkgs.obsidian}/bin/obsidian \
      --ozone-platform-hint=auto \
      --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer \
      "$@"
  '';
in
{
  environment.systemPackages = [
    obsidian-wayland
  ];
}
