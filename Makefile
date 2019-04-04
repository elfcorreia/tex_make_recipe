# MIT License
# 
# Copyright (c) 2019 Emerson C. Lima
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

.PHONY: tempdir all clear

TEX = pdflatex -interaction=nonstopmode -shell-escape
BIB = biber

pwd := $(shell pwd)
build_dir := $(shell mktemp -d)

# all: article.pdf presentation.pdf other.pdf

.ONESHELL:
tempdir: $(build_dir)	
	echo "Building temporary dir $(build_dir)"
	find $(pwd) -type d -exec ln -s {} $(build_dir) \;
	find $(pwd) -name "*.tex" -type f -exec ln -s {} $(build_dir) \;
	find $(pwd) -name "*.sty" -type f -exec ln -s {} $(build_dir) \;
	find $(pwd) -name "*.bib" -type f -exec ln -s {} $(build_dir) \;
	find $(pwd) -name "*.pdf" -type f -exec ln -s {} $(build_dir) \;

.ONESHELL:
%.pdf : %.tex tempdir
	echo "Building $(*F) $< $@"
	cd $(build_dir)
	-rm $@
	$(TEX) -draftmode $<
	$(BIB) $(*F)
	$(TEX) $<
	$(TEX) $<
	cp $@ $(pwd)