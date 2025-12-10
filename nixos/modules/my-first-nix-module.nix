{ config, lib, pkgs, ... }:

let
	cfg = config.myFirstNixModule;
in
{
	options.myFirstNixModule = {
		enable = lib.mkEnableOption "demo module that enables passing config to a module";
		message = lib.mkOption {
			default = "Default string, please set using myFirstNixModule.message";
			type = lib.types.str;
			description = "Message to write into xdg config";
		};
	};

	config = lib.mkIf cfg.enable {
		xdg.configFile."my-first-nix-module/message.txt".text = cfg.message;
		home.packages = [
			(pkgs.writeShellScriptBin "print-xdg-message" ''
				#!/usr/bin/env bash
				set -e
				CONFIG_FILE="$XDG_CONFIG_HOME/my-first-nix-module/message.txt"
				echo "Reading from $CONFIG_FILE"
				cat "$CONFIG_FILE"
			'')
		];
	};
}

