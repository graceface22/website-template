BUILD_TOOLS_SCOPE = -g
CSS_MAIN_SRC = stylesheets/main.less
CSS_MAIN_TARGET = $(CSS_MAIN_SRC:%.less=%.min.css)
WATCH = stylesheets/*.less
COMPILE_SOURCES = $(wildcard $(WATCH))
REQUIREJS_CONFIG = javascripts/init.js
CSS_PREFIX_COMPAT = "last 2 version, ie 8, ie 9"
TARGETS = $(CSS_MAIN_TARGET)
JS_PATH = javascripts
JS_MAIN_DEV = app.dev
JS_MAIN_PROD = app.min

CMD_CSS_PREFIX = autoprefixer -b $(CSS_PREFIX_COMPAT) $(CSS_MAIN_TARGET)
CMD_LESS = lessc $(CSS_MAIN_SRC) $(CSS_MAIN_TARGET)
CMD_JS_CONFIG_DEV = sed -i '' 's/$(JS_MAIN_PROD)/$(JS_MAIN_DEV)/g' $(REQUIREJS_CONFIG)
CMD_JS_CONFIG_PROD = sed -i '' 's/$(JS_MAIN_DEV)/$(JS_MAIN_PROD)/g' $(REQUIREJS_CONFIG)
CMD_JS_OPTIMIZE = r.js -o baseUrl=$(JS_PATH) mainConfigFile=$(REQUIREJS_CONFIG) name=$(JS_MAIN_DEV) out=$(JS_PATH)/$(JS_MAIN_PROD).js

.PHONY: compile clean bower watch build-tools dist 

compile: $(TARGETS)

$(TARGETS): $(COMPILE_SOURCES)
	$(CMD_JS_CONFIG_DEV)
	$(CMD_LESS)
	$(CMD_CSS_PREFIX)

dist: bower
	$(CMD_LESS) --clean-css="--s1 --compatibility=ie8"
	$(CMD_CSS_PREFIX)
	$(CMD_JS_CONFIG_PROD)
	$(CMD_JS_OPTIMIZE)

clean: 
	$(CMD_JS_CONFIG_DEV)
	rm -f $(CSS_MAIN_TARGET) $(JS_PATH)/$(JS_MAIN_PROD).js

bower:
	bower install -p
	bower-requirejs -t -c $(REQUIREJS_CONFIG)

watch:
	onchange $(WATCH) -- make compile
	
build-tools:
	./install-tools.sh $(BUILD_TOOLS_SCOPE)

