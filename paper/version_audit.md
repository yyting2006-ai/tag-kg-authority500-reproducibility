# TAG-KG version and evidence audit

Audit date: 2026-09-26

## Authoritative paper state

The scientific mother manuscript is:

`F:\游庭睿学习\李吉梅\现有资料\分词研究\第三篇_时间状语识别\CAIT2026_TAG_KG_full_author.pdf`

This 10-page version is the only supplied paper artifact that reports the Primary/Full split, registered labeled-candidate metrics, the `.844/.701` flat-feature result, the `.875/.753` cascade point estimate, the `.030` retained joint risk, the recovered graph counts, and the three-call explanation audit. The article draft in this directory uses those values.

## Non-authoritative or earlier states

| Artifact | Observed state | Use in this journal package |
| --- | --- | --- |
| `CAIT2026_TAG_KG_author.pdf` | 5-page earlier author version; reports the older `.794/.679` compatibility-style result | Historical comparison only |
| `V5代码包.zip` | Cached reviewer package with `.794/.679` main results and a different metric protocol | Candidate implementation evidence; not mixed with the CAIT full-author headline numbers |
| `COLING V2代码包.zip` | Later package with `.862/.425` optimized KG-local results and a different paper protocol | Separate experimental state; not mixed with the CAIT full-author numbers |
| `NLE_V3.pdf` | Same-lexeme pair construction paper with CCS/COPE metrics | Separate research question; not used as the TAG-KG journal mother |

## Main numerical contract

The following values are frozen in `manuscript.md`, `manuscript.html`, `main.tex`, and the generated PDF:

- Authority500-Full: 468 sentence groups, 500 raw records, 495 unique exact keys.
- Primary: 477 records and 472 keys; Full: 500 records and 495 keys.
- Primary test: 98 records, 96 keys, 90 groups.
- Full test: 104 records, 102 keys, 94 groups, including six flagged records.
- Graph: 3,100 nodes, 11,110 edges, 54 rules, 37 cues.
- Construction audit: .956 coverage, .864 all-record agreement, .904 covered-record agreement.
- Primary flat adapter: .990 registered span recall, .853 conditional accuracy, .713 conditional macro-F1, .844 labeled recall, .701 macro labeled recall.
- Primary paired macro-recall gain: .336, 95% group-bootstrap CI [.217, .446], Holm-adjusted p=.0032.
- Full flat adapter: .971 registered span recall and .794 labeled recall.
- Risk-coverage: .156 at 1.00 coverage and .030 at .70 coverage.
- LLM explanation audit: 94 groups x 3 calls x 3 models = 846 calls.

## CAIT status and disclosure

The earlier CAIT 2026 submission (Paper CT3001) was withdrawn at the authors' request before registration and publication and was not included in the proceedings. The journal manuscript and cover letter state this exact administrative history and disclose that the submission is not under consideration elsewhere. The withdrawal email and note are retained in the project records; they do not change the scientific results frozen above.
