#!/usr/bin/env make -f
# The shebang line can be used to make makefiles executable,
# but is otherwise unnecessary.

# This is the default target, since it comes first.
# If you only have one target, you don't need this,
# but otherwise it will skip all but the first target.
all: readme.html readme.pdf
# Prevent make from looking for a file called 'all'
.PHONY : all

readme.html : readme.rst
	rst2html readme.rst > readme.html

readme.tex : readme.rst
	rst2latex readme.rst > readme.tex

readme.pdf : readme.tex readme.rst
	pdflatex -file-line-error readme.tex

# Keep make from looking for a file called 'clean'
.PHONY: clean
clean:
	rm -f readme.html
	rm -f readme.tex
	rm -f readme.pdf
	rm -f readme.log
	rm -f readme.aux
	rm -f readme.out
