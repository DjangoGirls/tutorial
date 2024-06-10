LANG      := en es
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
	@echo "    LANG: Language shortcodes are found in LANGS.md. Default is 'en'(English)."
	@echo "           ( Refer $(LANG_FILE) for shortcodes of Languages available. )"
	@echo
	@echo "Commands:"
	@echo "  help      - Display make command list."
	@echo "  dev       - Setup the project and start the development server with debugging enabled."
	@echo "  check     - Check for the root directory for various dependencies."
	@echo "  setup     - Setup the temporary language and install node dependencies for the development."
	@echo "  build     - Build the honkit project."
	@echo "  build-dev - Build the honkit project with debug log."
	@echo "  serve     - Start honkit server locally for development."
	@echo "  pdf       - Generate the PDF version of DjangoGirls tutorial."
	@echo "  epub      - Generate the EPUB version of DjangoGirls tutorial."
	@echo "  mobi      - Generate the MOBI version of DjangoGirls tutorial."
	@echo "  mode      - Shows the development mode status."
	@echo "  exit      - Exit development mode."
	@echo
	@echo "Example:"
	@echo
	@echo "$$ make dev LANG=es"
	@echo
	@echo "The above command will start the development server using the language Español."
	@echo "'LANG' argument is only required the first time until the exit command is executed."
	@echo

.git/hooks/pre-commit:
	@echo "#!/bin/sh\n\
\n\
if test -f \"./.langs\"; then\n\
  echo \"Error: You can't commit without exiting development mode.\\\n\\\n\\\\\
\nTry the following command to exit development mode:\\\n\\\n\\\\\
\n$$ make exit\\\n\" 1>&2;\n\
  exit 1\n\
fi\n" > ./.git/hooks/pre-commit
	@chmod u+x ./.git/hooks/pre-commit

node_modules:
	@npm install

check: package.json book.json LANGS.md
	@if ! which node 1> /dev/null; then\
		echo "Error: Node.js not found";\
		echo " * Please install/reinstall NodeJS on your system.";\
		echo " * NVM is recommended for installation (https://github.com/nvm-sh/nvm).";\
		false;\
	fi

setup: node_modules check .git/hooks/pre-commit
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
		rm -rf node_modules _book .git/hooks/pre-commit && echo "The project exited development mode.";\
	fi

pdf:
	$(call ebook_support,pdf)

epub:
	$(call ebook_support,epub)

mobi:
	$(call ebook_support,mobi)

.PHONY: help check setup build build-dev serve dev pdf epub mobi mode exit
