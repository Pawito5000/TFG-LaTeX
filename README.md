# TFG-LaTeX

A comprehensive LaTeX template for university thesis writing (TFG - Trabajo de Fin de Grado / Bachelor's Thesis).

## Features

- **Complete thesis structure** with all essential chapters
- **Professional formatting** using the `report` document class
- **Bibliography management** with BibLaTeX and Biber
- **Cross-referencing** for figures, tables, and citations
- **Code listing support** with syntax highlighting
- **Automated compilation** with Makefile
- **Build artifact management** with `.gitignore`

## Project Structure

```
TFG-LaTeX/
├── main.tex                    # Main document file
├── references.bib              # Bibliography database
├── Makefile                    # Build automation
├── .gitignore                  # Git ignore file for LaTeX artifacts
├── README.md                   # This file
└── chapters/                   # Individual chapter files
    ├── titlepage.tex           # Title page
    ├── abstract.tex            # Abstract
    ├── acknowledgments.tex     # Acknowledgments
    ├── introduction.tex        # Chapter 1: Introduction
    ├── literature_review.tex   # Chapter 2: Literature Review
    ├── methodology.tex         # Chapter 3: Methodology
    ├── results.tex             # Chapter 4: Results
    ├── discussion.tex          # Chapter 5: Discussion
    ├── conclusion.tex          # Chapter 6: Conclusion
    └── appendix_a.tex          # Appendix A
```

## Getting Started

### Prerequisites

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-bibtex-extra biber
```

**macOS (with MacTeX):**
```bash
brew install --cask mactex
```

**Windows:**
Install MiKTeX or TeX Live from their respective websites.

### Quick Start

1. **Clone or download** this template
2. **Customize** the document information in `main.tex`:
   ```latex
   \title{Your Thesis Title Here}
   \author{Your Name}
   ```
3. **Edit** the title page in `chapters/titlepage.tex`
4. **Compile** the document:
   ```bash
   make all
   ```

### Building the Document

**Full compilation (recommended):**
```bash
make all
```

**Quick compilation (single pass, no bibliography):**
```bash
make quick
```

**View the PDF:**
```bash
make view
```

**Clean build artifacts:**
```bash
make clean
```

## Customization

### Document Information

Edit the following lines in `main.tex`:
- `\title{Your Thesis Title Here}` - Your thesis title
- `\author{Your Name}` - Your name

### Title Page

Customize `chapters/titlepage.tex` with:
- University name
- Faculty/Department
- Degree program
- Supervisor information
- Submission date

### Adding Content

1. **Edit chapter files** in the `chapters/` directory
2. **Add references** to `references.bib`
3. **Include figures** in a `figures/` directory (create as needed)
4. **Add tables and equations** as needed

### Bibliography

Add references to `references.bib` using standard BibTeX format:

```bibtex
@article{author2024,
    title={Article Title},
    author={Author, First and Author, Second},
    journal={Journal Name},
    year={2024},
    volume={1},
    pages={1--10}
}
```

Cite in text using: `\cite{author2024}`

### Code Listings

Include code using the `listings` package:

```latex
\begin{lstlisting}[language=Python, caption=Example code]
def hello_world():
    print("Hello, World!")
\end{lstlisting}
```

### Figures and Tables

Include figures:
```latex
\begin{figure}[h]
\centering
\includegraphics[width=0.8\textwidth]{figures/example.png}
\caption{Example figure}
\label{fig:example}
\end{figure}
```

Reference with: `Figure \ref{fig:example}`

## Tips

- **Use `\label{}` and `\ref{}`** for cross-references
- **Compile frequently** to catch errors early
- **Use version control** (this template includes appropriate `.gitignore`)
- **Keep figures in a separate directory** (e.g., `figures/`)
- **Use meaningful labels** for easy reference management

## Troubleshooting

**Bibliography not showing:**
- Make sure to run the full compilation with `make all`
- Check that your `.bib` file has valid entries
- Ensure you have citations in your text (`\cite{key}`)

**Compilation errors:**
- Check for unmatched braces `{}`
- Verify package names and syntax
- Look at the log files in the `build/` directory

**Missing packages:**
- Install missing packages through your LaTeX distribution's package manager
- On Ubuntu/Debian: `sudo apt-get install texlive-full` for all packages

## License

This template is provided as-is for academic use. Modify and distribute freely.

## Contributing

Feel free to submit improvements, additional examples, or bug fixes via pull requests.