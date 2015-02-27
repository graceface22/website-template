#!/bin/bash

CMD="npm install -g"
PACKAGES=(bower bower-requirejs autoprefixer less less-plugin-clean-css onchange)

function exists() {
	npm list -g "$1" &> /dev/null || npm list "$1" &> /dev/null
}

echo "Installing required npm packages.."

for pkg in "${PACKAGES[@]}"
do
	if exists "$pkg"; then
		echo "[$pkg] already installed. Skipping"
	else
		echo "[$pkg] is missing. Installing now:"
		$CMD $pkg
	fi
done

echo "Done."
