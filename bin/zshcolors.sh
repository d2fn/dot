#!/bin/zsh

for code in {000..255}; do
	echo -en "\e[38;05;${code}m $code: Test\t";
done

