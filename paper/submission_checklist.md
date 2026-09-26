# Natural Language Processing submission checklist

Prepared against the current Cambridge author-information pages read on 2026-09-26:

- Journal scope: <https://www.cambridge.org/core/journals/natural-language-processing/information/about-this-journal>
- Instructions for contributors: <https://www.cambridge.org/core/journals/natural-language-processing/information/instructions-contributors>
- Originality and duplicate-submission policy: <https://www.cambridge.org/core/journals/natural-language-processing/information/author-instructions/preparing-your-materials>

## Scientific package

- [x] Article-length manuscript body exceeds 8,000 words before references.
- [x] One central claim: deterministic rule evidence improves registered-candidate macro recall and supports auditable selective review.
- [x] Primary and Full estimands are defined separately.
- [x] Construction-set agreement is labeled as resubstitution-only.
- [x] Unmatched generated spans are logged rather than treated as verified negatives.
- [x] Statistical unit, grouped bootstrap, Holm adjustment, and five repeated splits are stated.
- [x] LLM comparisons are labeled historical and not leakage-certified Primary baselines.
- [x] Limitations include candidate-centric sampling, source specificity, rule-development history, minority-class weakness, copyright, and lack of teacher user study.

## Journal presentation

- [x] Title page, affiliations, corresponding-author email, abstract, and five keywords are present.
- [x] Figures and tables are embedded in the PDF draft.
- [x] Competing interests, funding, data availability, ethics, author contributions, acknowledgements, AI-use disclosure, and prior-version disclosure are present.
- [x] References use an author-date prose style and include only sources inspected for this package.
- [x] Chinese examples use double quotation marks in the prose.

## Artifact checks

- [x] `manuscript.md` is the editable canonical article text.
- [x] `main.tex` is generated from the same Markdown source and uses the official `CUP-JNL-NLP.cls` class.
- [x] `manuscript.html` is generated from the same Markdown source.
- [x] `TAG_KG_journal_extension.pdf` was rendered from `manuscript.html` and visually inspected at representative pages.
- [x] PDF text extraction confirms `.844`, `.701`, `.030`, Table 5, Table 10, and 24 pages.
- [x] Figures are generated from the frozen table values.
- [x] Figure accessibility descriptions are supplied in `figure_alt_text.md`.
- [x] The claim-evidence ledger links every headline result to the CAIT full-author PDF and a package artifact.

## Required administrative readback

- [x] Confirm the formal CAIT 2026 status from the author-provided withdrawal letter; the manuscript and cover letter state that the earlier version was formally withdrawn.
- [x] Confirm all author names, affiliations, corresponding-author email, and funding wording from the supplied author-information and funding records (including Jimei Li spelling).
- [x] Confirm that the rights-cleared Authority500 source records and de-identified adjudication table may be released; annotator identities and private working files are excluded.
- [x] Keep the CAIT withdrawal email and withdrawal note available in case the editor requests documentary confirmation.
- [ ] Upload the final PDF and any required source files through the journal system after the administrative readback.
- [x] `main.tex` was compiled with the official class and the five figure PDFs are included for a reproducible source build.
