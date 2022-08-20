LANG      := en
LANG_FILE := $(shell test -f .langs && echo .langs || echo LANGS.md)
LANG_DATA := $(shell grep "$(LANG)/" $(LANG_FILE))
LANG_NAME := $(shell echo "$(LANG_DATA)" | sed 's/.*\[\(.*\)\].*/\1/')

define ebook_support
	@if which ebook-convert 1> /dev/null; then\
		npx honkit $(1) ./ ./djangogirls.$(1);\
	else\
		echo "Error: ebook-convert is not found";\
		echo " * Follow the guide at https://honkit.netlify.app/ebook";\
		echo "  - For Debian/Ubuntu, Try: sudo apt install calibre";\
		echo "  - For MacOS, Try: brew install --cask calibre";\
		echo "  - For Windows and any other OS, Download from https://github.com/kovidgoyal/calibre/releases";\
		false;\
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
	@echo "  exit      - Exit development mode."
	@echo

node_modules:
	@npm install

check: package.json book.json LANGS.md
	@if ! which node 1> /dev/null; then\
		echo "Error: Node.js not found";\
		echo " * Please install/reinstall NodeJS on your system.";\
		echo " * NVM is recommended for installation (https://github.com/nvm-sh/nvm).";\
		false;\
	fi

setup: node_modules check
	@if ! test -f ".langs"; then\
		cp LANGS.md .langs && \
		echo "$(LANG_DATA)" > LANGS.md && \
			echo "You are set to $(LANG_NAME) for development";\
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
	@if test -f ".langs"; then\
		echo "You are in development mode using the language $(LANG_NAME)";\
	else\
		echo "You are not in development mode";\
	fi

exit:
	@if test -f ".langs"; then\
		mv -f .langs LANGS.md && echo "Language file is restored";\
		rm -rf node_modules _book && echo "The project exited development mode.";\
	fi

pdf:
	$(call ebook_support,pdf)

epub:
	$(call ebook_support,epub)

mobi:
	$(call ebook_support,mobi)

.PHONY: help check setup build build-dev serve dev pdf epub mobi mode exit
