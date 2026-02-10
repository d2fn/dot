{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # language runtimes
    cargo
    clang
    clippy
    gcc
    go
    delve
    gopls
    jdk25
    jdt-language-server
    lazygit
    lua-language-server
    nodejs
    protobuf
    rustc
    rustfmt
    sqlite
    tree-sitter
  ];
}
