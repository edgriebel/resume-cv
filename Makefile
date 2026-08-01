export DOC=Ed_Griebel_Resume

DOCKER_IMAGE=edgriebel/tinytex-xelatex-2026
# DOCKER_IMAGE=edgriebel/tinytex-xelatex-alpine

DEFAULT: make-docker

all: clean $(DOC).pdf images

view: $(DOC).pdf
	@# Open the PDF if an appropriate opener is available
	@if command -v open >/dev/null 2>&1; then open "$(DOC).pdf"; \
	elif command -v xdg-open >/dev/null 2>&1; then xdg-open "$(DOC).pdf"; \
	else echo "No PDF opener found (tried 'open' and 'xdg-open')."; fi

%.pdf: %.tex
	latexmk -xelatex $?

images: $(DOC).pdf
ifneq (, $(shell hash gs 2>&1 > /dev/null && echo FOUND))
	gs -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pngmonod -r200 -sOutputFile=Miscellaneous/$(DOC)-%1d.png $?
# Old ver using ImageMagick, ghostscript works and is smaller install
## convert -density 150 -quality 90 -background white -alpha remove -alpha off $? Miscellaneous/$(DOC).png
else
	echo "'gs' command not found, is GhostScript installed?"
endif

clean:
	rm -f *.aux *.fdb_latexmk *.log *.out *.xdv *fls

cleanall: clean
	rm -f $(DOC).pdf

make-docker :
	docker run -v "$(CURDIR):/data" --rm $(DOCKER_IMAGE) /bin/sh -c "cd data; make DOC=$(DOC) all"
	$(MAKE) clean
	$(MAKE) view

make-image : Dockerfile
	docker build -t $(DOCKER_IMAGE) .

.PHONY: DEFAULT clean cleanall
