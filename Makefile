BUILD_TOOLS_SCOPE = -g
BOWER_TARGET = 
CSS_MAIN_SRC = stylesheets/main.less
CSS_MAIN_TARGET = $(CSS_MAIN_SRC:%.less=%.min.css)
CSS_WATCH = stylesheets/*.less
CSS_PREFIX_COMPAT = "last 2 version, ie 8, ie 9"

.PHONY: compile clean bower watch build-tools dist bower-install

compile: $(CSS_MAIN_TARGET)

$(CSS_MAIN_TARGET): $(CSS_WATCH)
	lessc $(CSS_MAIN_SRC) $(CSS_MAIN_TARGET) --clean-css="--s1 --compatibility=ie8"
	autoprefixer -b $(CSS_PREFIX_COMPAT) $(CSS_MAIN_TARGET)

clean:
	rm -f $(CSS_MAIN_TARGET) 

bower:
	bower install -p

bower-install:
	bower install -p $(BOWER_TARGET) --save

watch:
	onchange $(CSS_WATCH) -- make compile
	
build-tools:
	./install-tools.sh $(BUILD_TOOLS_SCOPE)

