# TAG-KG journal extension package

This directory contains the journal-length extension of the TAG-KG paper, prepared for *Natural Language Processing*.

## Files

- `manuscript.md`: editable canonical article text.
- `manuscript.html`: browser-printable article generated from `manuscript.md`.
- `main.tex`: LaTeX source generated from the same article text.
- `TAG_KG_journal_extension.pdf`: visually checked article PDF rendered from `manuscript.html`.
- `TAG_KG_NLP_submission_package.zip`: final synchronized submission package.
- `figures/`: five data-bearing SVG composite figures.
- `figure_alt_text.md`: accessibility descriptions for the five figures.
- `claim_evidence_ledger.csv`: claim-to-source and claim-to-artifact map.
- `version_audit.md`: version reconciliation and the resolved CAIT withdrawal disclosure.
- `submission_checklist.md`: journal-format, scientific, artifact, and administrative checks.
- `cover_letter.md`: cover letter with the confirmed CAIT withdrawal disclosure, author list, and funding statement.
- `validation_report.md`: automated consistency and artifact validation output.

## Build

```powershell
python .\build_figures.py
python .\build_manuscript.py
```

The PDF in this package was produced with Microsoft Edge headless print-to-PDF because a TeX engine was not available in the workspace. The LaTeX source is provided for the journal's source submission or a later TeX build. The PDF was rendered to PNG pages and inspected for layout, figure legibility, table alignment, Chinese glyphs, and headline-value visibility.

The included `main.tex` is a structurally checked source file generated from the canonical Markdown; it is **not** the official Cambridge NLP class. Cambridge's author package uses `CUP-JNL-NLP.cls` with `\documentclass{CUP-JNL-NLP}`. The current PDF is therefore a content-and-figure checked submission draft; before a source package is sent after acceptance, migrate this source into the official class files from the journal's [NLP LaTeX author package](https://www.cambridge.org/core/services/aop-file-manager/file/6616a846ff18e014ad92efd6).

## Scientific source boundary

The numerical source of truth is `CAIT2026_TAG_KG_full_author.pdf`. The earlier CAIT author version, the V5 code package, and the COLING V2 code package represent different experimental states and are documented in `version_audit.md`; their results are not mixed into this manuscript.
