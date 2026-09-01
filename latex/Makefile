TARGET = TCC_Guilherme_Storch.pdf

LATEX = pdflatex
BIBTEX = bibtex

VERSION = 0.1.0

FIXOS_DIR = fixos
FIXOS_SOURCES = informacoes.tex fichaCatalografica.tex \
		folhaDeAprovacao.tex pacotes.tex comandos.tex setup.tex	\
		listasAutomaticas.tex indiceAutomatico.tex

FIXOS_FILES = $(addprefix $(FIXOS_DIR)/, $(FIXOS_SOURCES))

EDITAVEIS_DIR = editaveis
EDITAVEIS_SOURCES = informacoes.tex introducao.tex metodologia.tex referencialTeorico.tex \
					revisaoEstruturada.tex planejamento.tex conclusao.tex \
					preTextuais/dedicatoria.tex preTextuais/agradecimentos.tex \
					preTextuais/epigrafe.tex preTextuais/resumo.tex \
					preTextuais/abstract.tex preTextuais/abreviaturas.tex \
					poesias/fibonacci.tex poesias/noiteEstrelada.tex poesias/girassois.tex \
					poesias/amarilis.tex poesias/ipes.tex poesias/elisio.tex

EDITAVEIS_FILES = $(addprefix $(EDITAVEIS_DIR)/, $(EDITAVEIS_SOURCES))

MAIN_FILE = tcc.tex
DVI_FILE  = $(addsuffix .dvi, $(basename $(MAIN_FILE)))
AUX_FILE  = $(addsuffix .aux, $(basename $(MAIN_FILE)))
PS_FILE   = $(addsuffix .ps, $(basename $(MAIN_FILE)))
PDF_FILE  = $(addsuffix .pdf, $(basename $(MAIN_FILE)))

SOURCES = $(FIXOS_FILES) $(EDITAVEIS_FILES)

.PHONY: all clean dist-clean

all: 
	@make $(TARGET)
    
$(TARGET): $(MAIN_FILE) $(SOURCES) bibliografia.bib
	echo $(EPS_TO_PDF_FILES)
	$(LATEX) $(MAIN_FILE)
	$(BIBTEX) $(basename $(MAIN_FILE))
	$(LATEX) $(MAIN_FILE)
	$(LATEX) $(MAIN_FILE)
	@cp $(PDF_FILE) $(TARGET)  


clean-soft:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx
	rm -f tcc.pdf

clean: clean-soft
	rm -f *.pdf
	
dist: clean-soft
	tar vczf tcc-fga-latex-$(VERSION).tar.gz *

dist-clean: clean
	rm -f $(PDF_FILE) $(TARGET)
