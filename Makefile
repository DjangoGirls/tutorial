LANG      := en
LANG_FILE := $(shell test -f LANGS.md.bak && echo LANGS.md.bak || echo LANGS.md)
LANG_DATA := $(shell grep "$(LANG)/" $(LANG_FILE))
LANG_NAME := $(shell echo "$(LANG_DATA)" | sed 's/.*\[\(.*\)\].*/\1/')
NODE      := $(shell which nodse 1> /dev/null && echo "true")

define ebook_support
	@if which ebook-convert 1> /dev/null; then\
		npx honkit $(1) ./ ./djangogirls.$(1);\
	else\
		echo "Error: ebook-convert is not found. Follow the guide at https://honkit.netlify.app/ebook";\
	fi
endef

help:
	@echo
	@echo "Usage: make command [LANG=<language_short_code>]"
	@echo
	@echo "    LANG : Language short codes are found in LANGS.md. Default is 'en'(English)."
	@echo "           ( Refer $(LANG_FILE) for short codes of Languages avaiable. )"
	@echo
	@echo "Commands:"
	@echo "  help      - Display make command list."
	@echo "  dev       - Setup project and start the development server with debugging enabled."
	@echo "  check     - Check for root directory for various dependencies."
	@echo "  setup     - Setup the temporary language and install node dependencies for the development."
	@echo "  build     - Build the honkit project."
	@echo "  build-dev - Build the honkit project with debug log."
	@echo "  serve     - Start honkit server locally for development."
	@echo "  pdf       - Generate PDF version of DjangoGirls tutorial."
	@echo "  epub      - Generate EPUB version of DjangoGirls tutorial."
	@echo "  mobi      - Generate MOBI version of DjangoGirls tutorial."
	@echo "  mode      - Shows the development mode status."
	@echo "  exit      - Reset the project and exit development mode."
	@echo

check: package.json book.json LANGS.md
ifeq ($(NODE),)
	$(error NodeJS not found. Please install/reinstall Node.js. NVM is recommended for installation(https://github.com/nvm-sh/nvm))
endif

setup: check
	@if ! test -f "LANGS.md.bak"; then\
		cp LANGS.md LANGS.md.bak && echo "Language file backup is created.";\
		echo "$(LANG_DATA)" > LANGS.md && echo "Language list is reduced to $(LANG_NAME) for development";\
		npm install && echo "Project is ready for development.";\
	fi

build: setup
	@npx honkit build

build-dev: setup
	@npx honkit build --log=debug

serve: setup
	@npx honkit serve

dev: setup
	@npx honkit serve --log=debug

mode:
	@if test -f "LANGS.md.bak"; then\
		echo "You are in development mode";\
	else\
		echo "You are not in development mode";\
	fi

exit:
	@if test -f "LANGS.md.bak"; then\
		mv -f LANGS.md.bak LANGS.md && echo "Language file is reset";\
		rm -rf node_modules _book && echo "The project exited development mode.";\
	fi

pdf:
	$(call ebook_support,pdf)

epub:
	$(call ebook_support,epub)

mobi:
	$(call ebook_support,mobi)

.PHONY: help check reset setup build build-dev serve dev pdf epub mobi mode exit
