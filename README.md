# TAG-KG Authority500 Reproducibility Release

This repository contains the public reproducibility release for:

> TAG-KG: Auditable Rule-Evidence Reranking for Chinese Temporal-Function Diagnosis

The release supports inspection of the journal extension submitted to *Natural Language Processing*. The data and annotation files were authorized for public release by the authors.

## Contents

- `data/authority500_full_sentences.jsonl`: 468 sentence groups and 500 raw candidate records.
- `data/authority500_full_gold_annotations.jsonl`: the 500 candidate annotations used by the Authority500-Full protocol.
- `data/authority500_full_annotations.csv`: flat tabular export of the annotations.
- `data/authority500_full_annotations.xlsx`: workbook view with the annotation table and field descriptions.
- `data/authority_sources.csv`: source provenance and authority metadata.
- `data/rules_mvp.csv`: label-conditioned grammar rules and diagnostic cues.
- `data/schema.json`: graph and annotation schema.
- `data/splits/`: sentence-group train, development, and test identifiers.
- `graph/`: verified candidate-centric graph nodes, edges, JSON, integrity reports, audit tables, and query examples (3,100 nodes and 11,110 directed typed edges).
- `results/`: fixed and repeated Primary-477 evaluation outputs, paired bootstrap intervals, locked Full-500 checks, and risk-coverage tables.
- `protocol/`: public split/mask manifests and data-protocol validation summaries.
- `paper/`: the journal PDF, Markdown/LaTeX source, evidence ledger, and version audit.
- `supplement/TAG_KG_NLP_submission_package.zip`: synchronized submission package.
- `RELEASE_NOTE.md`: scope, de-identification, provenance, and release-boundary record.

## Quick inspection

The JSONL files can be read without external services. The workbook is a convenience export of the same annotation records. Graph counts and headline claims can be checked against `paper/claim_evidence_ledger.csv`, the manuscript PDF, and the public result tables. The graph's full-collection rule checks are construction-set audits; the sentence-grouped Primary experiments are the predictive evaluation.

The public release excludes annotator names, contact details, free-text comments, source scans, API keys, service credentials, and cached model binaries. The graph export can be inspected without a live Neo4j instance; anonymized rater IDs are structural identifiers only. Re-running external LLM or parser baselines may require separately installed models or user-provided credentials.

## Data statement

The collection is a candidate registry for Chinese temporal-function diagnosis in language-education materials. It is not an exhaustive open-span corpus or a balanced sample of contemporary Chinese. The four principal labels are `TEMPORAL_ADVERBIAL`, `ATTRIBUTE`, `COMPLEMENT`, and `OTHER`; the annotation records retain quality and evaluation-status fields for audit.

Please preserve sentence identifiers, candidate identifiers, offsets, and provenance fields when producing derived data. Cite the accompanying journal article and this repository when using the release.

## Citation

See `CITATION.cff` and the paper files in `paper/`. The stable repository URL is https://github.com/yyting2006-ai/tag-kg-authority500-reproducibility.

## Contact

Corresponding author: Jaimei Li, Ljm@blcu.edu.cn.
