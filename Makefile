.PHONY: default test

SHELL=/bin/bash

default:
	set -euo pipefail; \
	shopt -s inherit_errexit; \
	echo 'Starting...'; \
	for i in {25..1}; do \
		if [ -f "./src/day$$i" ]; then \
			./src/day$$i |& while read -r line; do printf '[day%02d]: %s\n' "$$i" "$$line"; done; \
		fi; \
	done; \
	echo 'Done.'

test:
	shellcheck --check-sourced --severity=style ./src/day*

	set -euo pipefail; \
	shopt -s inherit_errexit; \
	echo 'Starting...'; \
	for i in {25..1}; do \
		if [ -f "./src/day$$i" ]; then \
			TEST=1 ./src/day$$i |& while read -r line; do printf '[day%02d]: %s\n' "$$i" "$$line"; done; \
		fi; \
	done; \
	echo 'Done.'
