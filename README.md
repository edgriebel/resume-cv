simple-resume-cv
================

Template for a simple resume or curriculum vitae (CV), in XeLaTeX.

**Compiled sample document:**<br>
[CV.pdf](https://raw.githubusercontent.com/zachscrivena/simple-resume-cv/master/CV.pdf)

**Sample pages (click to enlarge):**

<img height="500" src="https://raw.githubusercontent.com/zachscrivena/simple-resume-cv/master/Miscellaneous/CV-01.png" alt="CV-01">
<img height="500" src="https://raw.githubusercontent.com/zachscrivena/simple-resume-cv/master/Miscellaneous/CV-02.png" alt="CV-02">
<img height="500" src="https://raw.githubusercontent.com/zachscrivena/simple-resume-cv/master/Miscellaneous/CV-03.png" alt="CV-03">

## Main Features

- Simple template that can be further customized or extended.
- Template document contains numerous examples.
- Direct support for TrueType (TTF) and OpenType (OTF) fonts.
- Direct support for multilingual Unicode characters, with the appropriate fonts.
- Hyperlinks can be included in generated PDF.

## Overview

The main XeLaTeX source file is `Ed_Griebel_CV.tex`; the compiled document is `Ed_Griebel_CV.pdf`.

Instructions for compiling the document (TeX &rarr;(XeLaTeX)&rarr; PDF):

- **Method 0:** On Windows:
	- install MiKTeX: <https://miktex.org/howto/install-miktex>. 
		- This installs TexWorks also.
		- This installs necessary TeX apps, libraries, and fonts specified in doc and also works well with proxies (set up in MiKTeX Console)
		- I have found this works better than installing xelatex and latexmk in Cygwin
	- Open `Ed_Griebel_CV.tex`
	- Select `XeLaTeX` from drop-down
	- Click play button on left
		- Note that this takes a long time the first time it's run and appears to be stuck loading `tex/latex/base/size10.clo`
	- Run a second time to update the page numbers at the bottom of each page

- **Method 1:** Use `latexmk` for fully automated document generation:
	- `latexmk -xelatex "CV.tex"`
	(add the `-pvc` switch to automatically recompile on changes)

- **Method 2:** Use `XeLaTeX` directly:
	- `xelatex "CV.tex"`
	(run multiple times to resolve cross-references if needed)

- **Method 3:** Use `XeLaTeX` via docker container:
	- install docker
	- `docker build -t texlive .`
	- `docker run -v <this directory>:/data/resume-cv --rm texlive`
	- Look for `Ed_Griebel_CV.pdf`

## License

This is free and unencumbered software released into the public domain.
For more information, please see the file `LICENSE` or refer to <http://unlicense.org>.

## Recent Changes

- Release v3.0
	- Provides better support for other packages (e.g., biblatex) by removing the use of the longtable package for layout.
	- Note that this release introduces breaking changes; documents created using earlier releases of this template will need some minor changes to compile successfully.
