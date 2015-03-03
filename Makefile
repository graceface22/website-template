BUILD_TOOLS_SCOPE = -g
CSS_MAIN_SRC = stylesheets/main.less
CSS_MAIN_TARGET = $(CSS_MAIN_SRC:%.less=%.min.css)
WATCH = stylesheets/*.less
COMPILE_SOURCES = $(wildcard $(WATCH))
REQUIREJS_CONFIG = javascripts/config.js
CSS_PREFIX_COMPAT = "last 2 version, ie 8, ie 9"
TARGETS = $(CSS_MAIN_TARGET)

CMD_CSS_PREFIX = autoprefixer -b $(CSS_PREFIX_COMPAT) $(CSS_MAIN_TARGET)
CMD_LESS = lessc $(CSS_MAIN_SRC) $(CSS_MAIN_TARGET)

.PHONY: compile clean bower watch build-tools dist

compile: $(TARGETS)

$(TARGETS): $(COMPILE_SOURCES)
	$(CMD_LESS)
	$(CMD_CSS_PREFIX)

dist:
	$(CMD_LESS) --clean-css="--s1 --advanced --compatibility=ie8"
	$(CMD_CSS_PREFIX)

clean:
	rm -f $(CSS_MAIN_TARGET)

bower:
	bower install -p
	bower-requirejs -t -c $(REQUIREJS_CONFIG)

watch:
	onchange $(WATCH) -- make compile
	
build-tools:
	./install-tools.sh $(BUILD_TOOLS_SCOPE)

