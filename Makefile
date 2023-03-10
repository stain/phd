#LATEXMK=latexmk
#LATEXMK=docker run -v `pwd`:/workdir -it ghcr.io/dante-ev/texlive:2021-C latexmk
#
#all: build/main.pdf
#	echo Done
#
#preview:
#	${LATEXMK} -cd -r latexmkrc -bibtex -f -gg -pdflua -latexoption=-interaction=nonstopmode -pvc
#
#main.tex: chapter*.tex references.tex summary*.tex
#
#build/main.pdf: main.tex
#	${LATEXMK} -cd -r latexmkrc -bibtex -f -gg -pdflua -latexoption=-interaction=nonstopmode 
#clean:	
#	${LATEXMK} -cd -r latexmkrc -bibtex -C -pdflua -latexoption=-interaction=nonstopmode

#latexmk=latexmk -use-make-
latexmk=docker run -v `pwd`:/work -w /work -e TEXMFCACHE=/work/build/cache -u `id -u` -it registry.gitlab.com/islandoftex/images/texlive:TL2022-2023-01-22-full latexmk -use-make-

all: build/main.pdf

clean:
	rm -rf build

build/cache:
	mkdir -p build/cache

build/main.pdf: *.tex build/cache
	$(latexmk) -nobibtex main
