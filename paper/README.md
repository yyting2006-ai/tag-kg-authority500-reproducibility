# TAG-KG journal extension package

This directory contains the journal-length extension of the TAG-KG paper, prepared for *Natural Language Processing*.

## Files

- `manuscript.md`: editable canonical article text.
- `manuscript.html`: browser-printable article generated from `manuscript.md`.
- `main.tex`: LaTeX source generated from the same article text.
- `TAG_KG_journal_extension.pdf`: visually checked article PDF compiled with Cambridge's `CUP-JNL-NLP.cls`.
- `TAG_KG_NLP_submission_package_20260927_official_tex_v3.zip`: internal full archive; use the clean production source package prepared in the local upload bundle.
- `figures/`: five data-bearing PDF figures with matching editable SVG sources.
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

The PDF is compiled with Cambridge's `CUP-JNL-NLP.cls` using XeLaTeX. The package includes the official class, the required local support files, and PDF copies of the five SVG figures for TeX compilation. The PDF was rendered to PNG pages and inspected for layout, figure legibility, table alignment, mathematical typesetting, Chinese glyphs, and headline-value visibility.

The source class and authoring guide come from Cambridge's [NLP LaTeX author package](https://www.cambridge.org/core/services/aop-file-manager/file/6616a846ff18e014ad92efd6). The initial ScholarOne upload remains the PDF; the TeX source is included so the editor can reproduce the official-class build if requested.

## Scientific source boundary

The numerical source of truth is `CAIT2026_TAG_KG_full_author.pdf`. The earlier CAIT author version, the V5 code package, and the COLING V2 code package represent different experimental states and are documented in `version_audit.md`; their results are not mixed into this manuscript.
