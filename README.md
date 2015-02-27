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

For convenience you can execute "npm run install-tools" which installs 
them via npm globally. If you do not want a global install, call "npm run install-tools -- local"

## Getting Started
- Run 'npm install' for installation
- Run 'npm run install-tools' to install missing commandline build tools
- Run 'npm run bower' (also autowires dependencies for AMD in bower.json)

## Working on a website
- Run 'npm run bower' if you added a dependency in bower.json
- Run 'npm run watch' to recompile .less files on change
- Run 'npm run compile' to recompile .less files manually
- Run 'npm run clean' to cleanup compiled files
