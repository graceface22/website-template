#!/bin/bash
FLAG="-g"
if [ "$1" == "local" ]; then
	FLAG=""
fi
CMD="npm install $FLAG"
BUILD_TOOLS=(bower bower-requirejs autoprefixer less less-plugin-clean-css onchange)

function exists() {
	npm list -g "$1" &> /dev/null || npm list "$1" &> /dev/null
}

echo "Installing required npm build tools.."

for tool in "${BUILD_TOOLS[@]}"
do
	if exists "$tool"; then
		echo "[$tool] already installed. Skipping"
	else
		echo "[$tool] is missing. Installing now:"
		$CMD $tool
	fi
done

echo "Done."