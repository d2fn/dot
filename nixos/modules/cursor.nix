{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cursur-flake.packages.x86_64-linux.cursor
  ];

}
