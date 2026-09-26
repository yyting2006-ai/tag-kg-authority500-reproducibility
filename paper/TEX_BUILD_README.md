# TeX build notes

`main.tex` uses the Cambridge NLP authoring class `CUP-JNL-NLP.cls` from the official NLP LaTeX author package. Compile it twice with XeLaTeX so the page and running-head references settle:

```text
xelatex -interaction=nonstopmode main.tex
xelatex -interaction=nonstopmode main.tex
```

The repository carries small local compatibility files for `sourcesanspro.sty`, `arydshln.sty`, `soul.sty`, and `framed.sty` because the bundled minimal TeX runtime does not include those dependencies. The journal class itself is the Cambridge v1.1 class file; the compatibility files do not alter the article content or mathematical notation.
