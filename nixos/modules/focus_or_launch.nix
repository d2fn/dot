{ pkgs, ... }:

let
  focus_or_launch = pkgs.writeShellScriptBin "focus_or_launch" ''
		#!/usr/bin/env bash

		focus_or_launch() {
				local app="$1"
				local class="$2"

				if [[ -z "$app" ]]; then
						echo "usage: focus_or_launch <app> <class>"
						exit 1
				fi

				if hyprctl clients | grep -qi "$class"; then
						hyprctl dispatch focuswindow "class:$class"
				else
						"$app" &
				fi
		}

		focus_or_launch "$1" "$2"
  '';
in {
  home.packages = [
    focus_or_launch
  ];
}

