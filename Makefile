# Makefile for LaTeX thesis compilation
# Main document name (without .tex extension)
MAIN = main

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biber

# Output directory for build artifacts
BUILD_DIR = build

.PHONY: all clean view help setup

# Default target
all: $(MAIN).pdf

# Create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Main compilation target
$(MAIN).pdf: $(MAIN).tex $(BUILD_DIR)
	@echo "Compiling LaTeX document..."
	$(LATEX) -output-directory=$(BUILD_DIR) $(MAIN).tex
	@echo "Running biber for bibliography..."
	$(BIBTEX) $(BUILD_DIR)/$(MAIN)
	@echo "Second LaTeX compilation for references..."
	$(LATEX) -output-directory=$(BUILD_DIR) $(MAIN).tex
	@echo "Final LaTeX compilation for cross-references..."
	$(LATEX) -output-directory=$(BUILD_DIR) $(MAIN).tex
	@echo "Moving final PDF to root directory..."
	cp $(BUILD_DIR)/$(MAIN).pdf .

# Quick compilation (single pass, no bibliography)
quick: $(MAIN).tex $(BUILD_DIR)
	@echo "Quick compilation (single pass)..."
	$(LATEX) -output-directory=$(BUILD_DIR) $(MAIN).tex
	cp $(BUILD_DIR)/$(MAIN).pdf .

# View the PDF (requires a PDF viewer)
view: $(MAIN).pdf
	@if command -v xdg-open >/dev/null 2>&1; then \
		xdg-open $(MAIN).pdf; \
	elif command -v open >/dev/null 2>&1; then \
		open $(MAIN).pdf; \
	else \
		echo "No suitable PDF viewer found. Please open $(MAIN).pdf manually."; \
	fi

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)
	rm -f $(MAIN).pdf

# Clean everything including the main PDF
clean-all: clean
	rm -f *.pdf

# Setup: install required LaTeX packages (Ubuntu/Debian)
setup:
	@echo "Installing required LaTeX packages..."
	sudo apt-get update
	sudo apt-get install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-bibtex-extra biber

# Word count (approximate)
wordcount:
	@echo "Approximate word count (excluding LaTeX commands):"
	@find chapters -name "*.tex" -exec cat {} \; | \
		sed 's/\\[a-zA-Z]*\(\[[^]]*\]\)\?{[^}]*}//g' | \
		sed 's/\\[a-zA-Z]*//g' | \
		wc -w

# Help target
help:
	@echo "Available targets:"
	@echo "  all       - Compile the complete thesis (default)"
	@echo "  quick     - Quick compilation (single pass, no bibliography)"
	@echo "  view      - Open the PDF in the default viewer"
	@echo "  clean     - Remove build artifacts"
	@echo "  clean-all - Remove all generated files including PDF"
	@echo "  setup     - Install required LaTeX packages (Ubuntu/Debian only)"
	@echo "  wordcount - Show approximate word count"
	@echo "  help      - Show this help message"