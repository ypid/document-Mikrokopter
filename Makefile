include $(HOME)/Skripten/makefiles/latex/Makefile.rules

TEXORGFILE	= Mikrokopter
TEXFILE		= $(TEXORGFILE)
FILE		= $(TEXORGFILE)

TEXBTFILE	= $(TEXORGFILE)-heavy
## Muss in "main" liegen mit ln -s main/doc.tex doc.tex

UPLOADFILE	= "$(TEXFILE).pdf"
## Dateien werden vor einem Upload nach /tmp Kopiert
UPLOADDIR	= Klasse/11
UPLOAD		?= $(UPLOADCOM) /httpdocs/$(UPLOADDIR) /tmp/$(UPLOADFILE)
## Geht nur bei einer Datei

include $(HOME)/Skripten/makefiles/latex/Makefile.if

main: $(TEXFILE).pdf log

light: main

all: light upload
	make FILE="$(TEXBTFILE)"
#	$(UPLOAD)

gitdiffs:
	LaTeX-git-wdiff.sh v1.0..HEAD \
	files/chapters/Vorwort.tex \
	files/chapters/Drohnen.tex \
	files/chapters/bau.tex \
	files/chapters/bauteile/FC.tex \
	files/chapters/bauteile/Bluetooth-Modul.tex \
	files/chapters/bauteile/MKGPS.tex \
	files/chapters/Autonomie.tex \
	files/chapters/Nachwort.tex \
	files/chapters/Danksagung.tex \
	> files/git/wdiffs/all.tex
	$(TPUTDONE)
	echo "gitdiffs done"
	$(TPUTRESET)

include $(HOME)/Skripten/makefiles/latex/Makefile.targets

