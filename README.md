# Who Am I?

Full Stack Developer with over 20 years of success creating software solutions.
Wide breadth of experience in multiple industries, languages, tools, and third-party applications demonstrates success.
Excitement about creating code to deliver high quality useful software results in systems that support business growth.

Resume: [Ed_Griebel_onepage_CV.pdf](https://raw.githubusercontent.com/edgriebel/resume-cv/master/Ed_Griebel_onepage_CV.pdf)

# Creating the resume:

My resume is written in LaTeX, this lets me use simple diff commands to compare versions.
I can also store different versions or notes to myself in the comments in the `.tex` file.

## How to Build

The main XeLaTeX source file is `Ed_Griebel_onepage_CV.tex`; the compiled document is `Ed_Griebel_onepage_CV.pdf`.

Instructions for compiling the document (TeX &rarr;(XeLaTeX)&rarr; PDF):
- **Even More Preferred Method:**
	- Install Docker
		- MacOS: `brew install docker`
	- Invoke `make` target that runs Docker image:
		- `make make-docker`
	- See "Build new docker image as needed" below

- **Preferred Method:**
	- Install Docker
		- MacOS: `brew install --cask docker`
	- Run Docker container to create PDF
		- `docker run -v $PWD:/data --rm edgriebel/tinytex-xelatex /bin/bash -c 'cd data; make'`
	- Run Docker interactively
		- `docker run -it -v $PWD:/data --rm edgriebel/tinytex-xelatex`
	- Build new docker image as needed
		- `docker build -t tinytex-xelatex`
		- log into docker: `docker login --username=yourhubusername --email=youremail@company.com`
		- tag the image
		- Push to docker hub: `docker push yourhubusername/repo-name`


- **Method 0:** On Windows:
	- install MiKTeX: <https://miktex.org/howto/install-miktex>. 
		- This installs TexWorks also.
		- This installs necessary TeX apps, libraries, and fonts specified in doc and also works well with proxies (set up in MiKTeX Console)
		- I have found this works better than installing xelatex and latexmk in Cygwin
	- Open `Ed_Griebel_onepage_CV.tex`
	- Select `XeLaTeX` from drop-down
	- Click play button on left
		- Note that this takes a long time the first time it's run and appears to be stuck loading `tex/latex/base/size10.clo`
	- Run a second time to update the page numbers at the bottom of each page

- **Method 1:** Use `latexmk` for fully automated document generation:
	- `latexmk -xelatex "Ed_Griebel_onepage_CV.tex"`
	(add the `-pvc` switch to automatically recompile on changes)

- **Method 2:** Use `XeLaTeX` directly:
	- `xelatex "Ed_Griebel_onepage_CV.tex"`
	(run multiple times to resolve cross-references if needed)

- **Method 3:** Use `XeLaTeX` via docker container:
	- install docker
	- `docker build -t tinytex .`
	- `docker run -v `pwd`:`pwd` -w `pwd` --rm tinytex make`
		- This updates the images displayed in this README also (in Miscellaneous directory)
	- Look for `Ed_Griebel_onepage_CV.pdf`

Based on: simple-resume-cv
================

Template for a simple resume or curriculum vitae (CV), in XeLaTeX.

**Compiled sample document:**<br>
[CV.pdf](https://raw.githubusercontent.com/zachscrivena/simple-resume-cv/master/CV.pdf)

**Sample pages (click to enlarge):**

<img height="500" src="https://raw.githubusercontent.com/edgriebel/resume-cv/master/Miscellaneous/Ed_Griebel_onepage_CV-1.png" alt="CV-1">
<img height="500" src="https://raw.githubusercontent.com/zachscrivena/simple-resume-cv/master/Miscellaneous/CV-03.png" alt="summary">

## Main Features

- Simple template that can be further customized or extended.
- Template document contains numerous examples.
- Direct support for TrueType (TTF) and OpenType (OTF) fonts.
- Direct support for multilingual Unicode characters, with the appropriate fonts.
- Hyperlinks can be included in generated PDF.

### License

This is free and unencumbered software released into the public domain.
For more information, please see the file `LICENSE` or refer to <http://unlicense.org>.

## Recent Changes

- Release v3.0
	- Provides better support for other packages (e.g., biblatex) by removing the use of the longtable package for layout.
	- Note that this release introduces breaking changes; documents created using earlier releases of this template will need some minor changes to compile successfully.
