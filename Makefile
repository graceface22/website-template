SCOPE = -g
CSS_MAIN_SRC = stylesheets/main.less
CSS_MAIN_TARGET = $(CSS_MAIN_SRC:%.less=%.min.css)
WATCH = stylesheets/*.less
COMPILE_SOURCES = $(wildcard $(WATCH))
REQUIREJS_CONFIG = javascripts/config.js
BROWSERS = "last 2 version, ie 8, ie 9"
TARGETS = $(CSS_MAIN_TARGET)

.PHONY: compile clean

compile: $(TARGETS)

$(TARGETS): $(COMPILE_SOURCES)
	lessc --clean-css="--s1 --advanced --compatibility=ie8" $(CSS_MAIN_SRC) $(CSS_MAIN_TARGET)
	autoprefixer -b $(BROWSERS) $(CSS_MAIN_TARGET)

clean:
	rm -f $(CSS_MAIN_TARGET)

bower:
	bower install -p
	bower-requirejs -t -c $(REQUIREJS_CONFIG)

watch:
	onchange $(WATCH) -- make compile
	
build-tools:
	./install-tools.sh $(SCOPE)

