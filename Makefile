#latexmk=latexmk
latexmk=docker run -v `pwd`:/work -w /work -e TEXMFCACHE=/tmp -u `id -u` -it registry.gitlab.com/islandoftex/images/texlive:TL2022-2023-01-22-full latexmk

all: build/thesis.pdf

clean:
	rm -rf build

build/main.pdf: *.tex
	$(latexmk) main

build/thesis.pdf: *.tex
	$(latexmk) -shell-escape thesis

