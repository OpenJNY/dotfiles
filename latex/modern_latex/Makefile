.SUFFIXES: .pdf

MAIN := main
BIB_FILE	:= references.bib
TEX_FILES	:= $(wildcard *.tex)
STY_FILES	:= $(wildcard *.sty)
IMG_DIRS	?= img
IMG_FILES	:= $(wildcard $(IMG_DIRS)/*.pdf $(IMG_DIRS)/*.png)

TEX     = uplatex -kanji=utf8 -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error
BIBTEX  = pbibtex -kanji=utf8
DVIPDF  = dvipdfmx -p a4
# DVIPDFFLAG = -f uptex-noEmbed-04.map -f otf-up-noEmbed.map
# DVIPDFFLAG = -f uptex-noEmbed-04.map -f otf-up-noEmbed.map
TEX2PDF = ptex2pdf -u -l -kanji=utf8
REFGREP=grep "^LaTeX Warning: Label(s) may have changed."

# ターゲット
all: $(MAIN).pdf
pdf: $(MAIN).pdf clean

# bib が絡まないならこれだけでおｋ
# $(MAIN).pdf: $(MAIN).tex $(TEX_FILES) $(STY_FILES)
# 	$(TEX2PDF) $(MAIN).tex

$(MAIN).pdf: $(MAIN).tex $(TEX_FILES) $(STY_FILES) $(FILE).bbl
	$(DVIPDF) $(DVIPDFFLAG) $(MAIN)
$(MAIN).dvi: $(MAIN).tex $(TEX_FILES) $(STY_FILES) $(FILE).bbl
	(while $(REFGREP) $(MAIN).log; do $(TEX) $(MAIN); done)
$(MAIN).aux: $(MAIN).tex $(TEX_FILES) $(STY_FILES) 
	$(TEX) $(MAIN)
$(FILE).bbl: $(MAIN).aux $(REFFILE)
	$(BIBTEX) $(MAIN)

.PHONY: clean distclean
clean:
	rm -f *.synctex.gz *.aux *.lof *.toc *.lot *.log *.ps *.blg *.bbl *.out *.fls *.fdb_latexmk *.dvi

distclean: clean
	rm -f $(MAIN).pdf
