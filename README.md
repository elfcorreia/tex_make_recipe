# TeX Makefile recipe

A Makefile recipe for building TeX files to PDF.

## Instalation

Place this Makefile in your TeX project directory.

## Usage

If you have a main TeX file `main.tex`, or `presentation.tex`, or any other name, just type: `make main.pdf` or `make presentation.pdf`

## Why

### A general recipe for articles and beamer

Any `.pdf` file can be build from `.tex` file. For example, if `slides.tex` is a beamer presentation, it can be build with `make slides.pdf`.

In this way we can share figures, tables, and others contents that must be present in both documents.

### A clean build

The build will be done in a random temporary directory in `/tmp`. After a successfull build, the output pdf is copied to project directory, letting the source tree clean, without auxiliary temporary files. All directory structure will be replicated in a temporary directory through symbolic links.