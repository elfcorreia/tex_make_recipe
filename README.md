# TeX Makefile recipe

A Makefile recipe for building TeX files to PDF.

## Instalation

Place this Makefile in your TeX project directory.

## Usage

If you have a main TeX file `main.tex`, or `presentation.tex`, or any other name, just type: `make main.pdf` or `make presentation.pdf`

## Why

### Local build is faster for large projects

The Overleaf build, for example, is very slow for large projects with many megabytes of images and text.

### Integration with text editors

This makefile allows you to use editors like Sublime Text, thats provides shortcut for building using `Ctrl+B`. Just add the target `all` with the documents you want to build. For example:

`all: doc1.pdf doc2.pdf`

### A general recipe for articles and beamer

Any `.pdf` file can be build from its main `.tex` file. For example, if `slides.tex` is a beamer presentation, it can be build with `make slides.pdf`. In this way we can share figures, tables, and others contents that must be present in both documents.

### A clean build

The build will be done in a random temporary directory in `/tmp`. After a successfull build, the output pdf is copied to project directory, letting the source tree clean, without auxiliary temporary files. 

### No directory structure imposed

All directory structure will be replicated in a temporary directory through symbolic links.