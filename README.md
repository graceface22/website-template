# website-template

Website template for HTML5 based websites with Twitter bootstrap and other javascript stuff based on bower.io

## Prerequisites
The following npm packages must be installed and accessible by the shell:

- bower
- bower-requirejs
- autoprefixer
- less
- less-plugin-clean-css (no access in shell required)
- onchange
- requirejs (for the r.js optimizer)

For convenience you can execute 'make build-tools' which installs 
them via npm globally. If you do not want a global install, call 'make build-tools SCOPE=local'

## Getting Started
- Run 'make build-tools' or 'make build-tools SCOPE=local' to install missing commandline build tools
- Run 'make bower' (also autowires dependencies for AMD in bower.json)

## Working on a website
- Run 'make bower' if you added a dependency in bower.json
- Run 'make watch' to recompile .less files on change
- Run 'make' or make compile' to recompile .less files manually
- Run 'make clean' to cleanup compiled files
