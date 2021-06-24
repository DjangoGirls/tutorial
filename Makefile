LANG		:= en
LANG_FILE	:= $(shell test -f LANGS.md.bak && echo LANGS.md.bak || echo LANGS.md)
LANG_DATA	:= $(shell grep "$(LANG)/" $(LANG_FILE))
LANG_NAME	:= $(shell echo "$(LANG_DATA)" | sed 's/.*\[\(.*\)\].*/\1/')

help:
	@echo
	@echo "Usage: make command [LANG=<language_short_code>]"
	@echo
	@echo "Language short codes are found in LANGS.md. ( For eg: LANG=es )"
	@echo "Default Language is 'en'(English)."
	@echo "Commands:"
	@echo "  init	- Initialise and Start the server."
	@echo "  serve	- Start honkit server locally for development."
	@echo "  setup	- Setup the temporary language for the development."
	@echo "  reset	- Reset the temporarily set language."
	@echo "  check	- Check for root directory for various dependencies."
	@echo "  help	- Display command list."

check: book.json LANGS.md package.json $(shell which node) $(shell which npx)

reset: 
	@if test -f "LANGS.md.bak"; then \
		mv -f LANGS.md.bak LANGS.md && echo "Language file is reset"; \
	else \
		echo "Language file backup is not found."; \
	fi

setup: reset
ifneq ($(LANG_FILE), "LANGS.md.bak")
	@cp LANGS.md LANGS.md.bak && echo "Language file backup is created."
	@echo "$(LANG_DATA)" > LANGS.md && echo "Language list is reduced to $(LANG_NAME) for development"
endif

serve:
	@npx honkit serve || (npm install && npx honkit serve)

init: check setup serve

.PHONY: help check reset setup serve init
