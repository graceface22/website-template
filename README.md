# website-template

Website template for HTML5 based websites with Twitter bootstrap and other javascript stuff based on bower.io

## Assets

The 'main.less' file is supposed to import all required stylesheet files. This file will be compiled and minified to 'main.min.css' which is the file to include in the html files.

The 'main.js' is the starting point for your application. There you can put your DOM manipulation.

## Prerequisites
The following npm packages must be installed and accessible by the shell:

- bower
- autoprefixer
- less
- less-plugin-clean-css (no access in shell required)
- onchange

For convenience you can execute 'make build-tools' which installs 
them via npm globally. If you do not want a global install, call 'make build-tools SCOPE=local'

## Getting Started
- Run 'make build-tools' or 'make build-tools SCOPE=local' to install missing commandline build tools
- Run 'make bower'

## Working on a website
- Run 'make bower' if you added a dependency in bower.json
- Or run 'make bower-install BOWER_TARGET="bower.package.name"' to install and save in bower.json in one step.
- Run 'make watch' to recompile .less files on change
- Run 'make' or make compile' to recompile .less files manually
- Run 'make clean' to cleanup compiled files
