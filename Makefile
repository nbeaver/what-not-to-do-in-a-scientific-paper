#!/usr/bin/env make -f
# The shebang line can be used to make makefiles executable,
# but is otherwise unnecessary.

# This is the default target, since it comes first.
# If you only have one target, you don't need this,
# but otherwise it will skip all but the first target.
all: what-I-will-not-do.html what-I-will-not-do.pdf
# Prevent make from looking for a file called 'all'
.PHONY : all

what-I-will-not-do.html : what-I-will-not-do.rst
	rst2html what-I-will-not-do.rst > what-I-will-not-do.html

what-I-will-not-do.tex : what-I-will-not-do.rst
	rst2latex what-I-will-not-do.rst > what-I-will-not-do.tex

what-I-will-not-do.pdf : what-I-will-not-do.tex what-I-will-not-do.rst
	pdflatex -file-line-error what-I-will-not-do.tex

# Keep make from looking for a file called 'clean'
.PHONY: clean
clean:
	rm --force what-I-will-not-do.html
	rm --force what-I-will-not-do.tex
	rm --force what-I-will-not-do.pdf
	rm --force what-I-will-not-do.log
	rm --force what-I-will-not-do.aux
	rm --force what-I-will-not-do.out
