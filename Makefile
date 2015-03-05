BUILD_TOOLS_SCOPE = -g
BOWER_TARGET = 
CSS_MAIN_SRC = stylesheets/main.less
CSS_MAIN_TARGET = $(CSS_MAIN_SRC:%.less=%.min.css)
CSS_WATCH = stylesheets/*.less
REQUIREJS_CONFIG = javascripts/init.js
CSS_PREFIX_COMPAT = "last 2 version, ie 8, ie 9"
JS_PATH = javascripts
JS_MAIN_DEV = app.dev
JS_MAIN_PROD = app.min

.PHONY: compile clean bower watch build-tools dist bower-install

compile: $(CSS_MAIN_TARGET) $(JS_MAIN_DEV)

$(CSS_MAIN_TARGET): $(CSS_WATCH)
	lessc $(CSS_MAIN_SRC) $(CSS_MAIN_TARGET) --clean-css="--s1 --compatibility=ie8"
	autoprefixer -b $(CSS_PREFIX_COMPAT) $(CSS_MAIN_TARGET)

$(JS_MAIN_DEV): 
	sed -i '' 's/$(JS_MAIN_PROD)/$(JS_MAIN_DEV)/g' $(REQUIREJS_CONFIG)

dist: bower $(CSS_MAIN_TARGET)
	sed -i '' 's/$(JS_MAIN_DEV)/$(JS_MAIN_PROD)/g' $(REQUIREJS_CONFIG)
	r.js -o baseUrl=$(JS_PATH) mainConfigFile=$(REQUIREJS_CONFIG) name=$(JS_MAIN_DEV) out=$(JS_PATH)/$(JS_MAIN_PROD).js

clean: $(JS_MAIN_DEV)
	rm -f $(CSS_MAIN_TARGET) $(JS_PATH)/$(JS_MAIN_PROD).js

bower:
	bower install -p
	bower-requirejs -t -c $(REQUIREJS_CONFIG)

bower-install:
	bower install -p $(BOWER_TARGET) --save
	bower-requirejs -t -c $(REQUIREJS_CONFIG)

watch:
	onchange $(CSS_WATCH) -- make compile
	
build-tools:
	./install-tools.sh $(BUILD_TOOLS_SCOPE)

