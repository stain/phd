#latexmk=latexmk
latexmk=docker run -v `pwd`:/work -w /work -e TEXMFCACHE=/work/build/cache -u `id -u` -it registry.gitlab.com/islandoftex/images/texlive:TL2022-2023-01-22-full latexmk

all: build/thesis.pdf

clean:
	rm -rf build

build/cache:
	mkdir -p build/cache

build/main.pdf: *.tex build/cache
	$(latexmk) main

build/thesis.pdf: *.tex build/cache
	$(latexmk) -shell-escape thesis

