# TAG-KG local evidence recovery report

## Bottom line

The supposedly missing candidate-centric graph was found outside the V5 zip at:

the `graph/` directory in this repository

It is not the older rule-centric `deep_kg_*` export. The recovered TAG-KG v2 export contains exactly 3,100 nodes, 11,110 edges, 500 candidate instances, 468 sentence nodes, 54 grammar rules, and 37 diagnostic cues. The A/B/C tier counts are 133/250/117. Independent rebuilding from the local cleaning CSV and current graph code reproduced all counts and all candidate and edge records (byte-identical after normalizing LF versus CRLF). The rebuilt node table differs in only one non-structural note string: `Added in TAG-KG...` versus `Added in KG v2...`.

The values 0.956 coverage, 0.864 all-instance accuracy, and 0.904 covered-instance accuracy are also exactly reproducible from the recovered candidate table. They are a full-collection construction/resubstitution audit after rule-layer optimization on the same 500 records. They are not independent held-out predictive results.

## Primary evidence

- Full node export: `kg_v2_nodes.csv`
- Full edge export: `kg_v2_edges.csv`
- JSON export: `kg_v2_graph.json`
- Candidate-level evidence table: `kg_v2_candidate_instances.csv`
- Final audit CSV: `KG_v2_effect_evaluation.csv`
- Optimization report: `KG_v2_optimization_report.md`
- Before/after diagnosis: `KG_v2_failure_diagnosis.md`
- Integrity summary: `KG_v2_integrity_summary.json`
- Public rule inventory: `../data/rules_mvp.csv`
- Candidate audit recomputation: `verify_candidate_audit.py`

## Independently reproduced graph counts

### Node types

| Type | Count |
| --- | ---: |
| AnnotationDecision | 1,500 |
| CandidateSpan | 500 |
| ConsensusLabel | 500 |
| Sentence | 468 |
| GrammarRule | 54 |
| DiagnosticCue | 37 |
| AmbiguityType | 16 |
| AuthoritySource | 10 |
| SyntacticFunction | 6 |
| CleaningStatus | 3 |
| CypherQueryTemplate | 3 |
| Annotator | 3 |
| Total | 3,100 |

### Edge types

| Type | Count |
| --- | ---: |
| TRIGGERS_CUE | 2,061 |
| HAS_AMBIGUITY | 1,690 |
| MATCHES_RULE | 1,519 |
| ANNOTATED_BY | 1,500 |
| MADE_BY | 1,500 |
| HAS_CANDIDATE | 500 |
| HAS_CONSENSUS | 500 |
| HAS_CLEANING_STATUS | 500 |
| MAPS_TO | 500 |
| DERIVED_FROM | 468 |
| CITES | 185 |
| ACTIVATES_RULE | 127 |
| SUPPORTS_FUNCTION | 54 |
| CAN_QUERY | 6 |
| Total | 11,110 |

### Integrity checks

- dangling_edges: 0
- candidate_without_sentence: 0
- candidate_without_consensus: 0
- candidate_without_cleaning_status: 0
- candidate_without_three_annotations: 0
- candidate_without_any_cue: 0

Candidate rule-match distribution: 22 candidates match 0 rules, 63 match 1, 84 match 2, 152 match 3, 63 match 4, and 116 match 5. Thus 478 of 500 candidates have at least one matched rule.

## Independently reproduced full-collection audit

| Slice | n | Covered | Correct | Coverage | Acc-all | Acc-covered |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| All | 500 | 478 | 432 | 0.956 | 0.864 | 0.903766 |
| A-main | 133 | 133 | 131 | 1.000 | 0.984962 | 0.984962 |
| B-boundary | 250 | 232 | 202 | 0.928 | 0.808 | 0.870690 |
| C-review | 117 | 113 | 99 | 0.965812 | 0.846154 | 0.876106 |

The archived macro-F1 values were also reproduced exactly when using the union of all gold and predicted labels, including the empty prediction used for uncovered cases: All 0.495842, A 0.664122, B 0.383539, C 0.607085.

## Why this audit must not be described as held-out performance

`KG_v2_failure_diagnosis.md` explicitly reports that the same full set first produced 0.660 coverage and 0.510 accuracy, then reached 0.956 and 0.864 after modifying diagnostic cues and GrammarRule entries. The final rule inventory contains eight `R_TEMP_KG_*` rules absent from the older 46-rule inventory. In addition, `src\rule_coverage.py` derives `REVIEW_NON_TARGET_RISK` from the candidate quality tier and risk flags, which are themselves stored annotation/cleaning evidence. Therefore the audit is valid as a construction-set coverage and stored-evidence consistency check, but not as an estimate of generalization.

Recommended wording: "On the 500-record graph-construction collection, after rule-layer development, TAG-KG covers 478 candidates (95.6%) and its highest-priority matched rule agrees with the adjudicated label for 432 candidates (86.4% overall; 90.4% among covered candidates). These are construction-set evidence-audit statistics, not held-out predictive scores."

## SHA256 hashes

| Artifact | SHA256 |
| --- | --- |
| COLING V5.pdf | `2BF0D522B35EAEF7724A899BB935AFE8A8FAFE810799FF2358C7279A69138919` |
| V5代码包.zip | `25E0BAE1640FCCE959178E2A326D1FC299C241175CF6FADC63BC93E2E56F383D` |
| Authority500 cleaning CSV | `235155AC9EB016909BCC01B065ED2B3C3DE6F4D3E979133A822BC241F464A6F2` |
| Authority500 cleaning workbook | `D7C36AEC025E02A95B605EE63C1FD4EEE84238C59EED08E9017B5D640DA30AA7` |
| kg_v2_nodes.csv | `17893B6FB1A382F781060CFC14B54BF00447F4BB3EA200633694AD076F2E15DE` |
| kg_v2_edges.csv | `60DB15A18A696A2B8B9B5D3C4FFD376847FEDF0A20FB8CC0DD342C9D61948019` |
| kg_v2_graph.json | `D94D306AD1DFB248489FA397B1A6A0146FD7C2B9396C46598C54B376EB13D8E2` |
| kg_v2_candidate_instances.csv | `1C76406A3C63FDB5524D3DFC1BD59B9784276FDDAD774FC62E2E8AD968C97FCF` |
| KG_v2_effect_evaluation.csv | `2245839535E6D95CC69F83449C9A2D14A1A714A0C05D5DD32DF93BA003B54079` |
| KG_v2_optimization_report.md | `B0F78A4C32DB89FF8F1EC22B8B778E33BD5AE3186199DD9C5629CD0C420EA58D` |
| KG_v2_failure_diagnosis.md | `94A4F20FB17128F4223C0DFFA1795D53E0D9D08A3CC102762BD8F07BBD8D9E9E` |
| KG_v2_integrity_summary.json | `CE28E973B574B44D64F7C5C311F25220D539622E382F7464FF39441E90E7B5D1` |
| Current 54-rule inventory | `1767D9C58286CD37A34987F49C7F421E5F8EF40275A04466D2D28EE76C42F0C9` |
| Older 46-rule inventory | `5BE82B40485C6F7D676CF60117567004732EE0E1DC3C6C87EDB812BCCF7F7942` |

## Content that can be restored to the CAIT paper

1. Restore the exact graph-scale claim, but call it the final candidate-centric export rather than the older `deep_kg_*` graph.
2. Restore the graph integrity statement because all six structural checks independently return zero failures.
3. Restore the A/B/C graph-audit table with an explicit construction-set/resubstitution qualifier.
4. Replace the current limitation claiming that a full candidate graph export is missing. The export has been recovered.
5. Add the final `deliverables\kg_v2` files and cleaning audit source to the submission reproducibility package, because the supplied V5 zip contains only the earlier 211-node/602-edge rule-centric export.

Source locations in the original manuscript:

- Graph count and integrity paragraph: current manuscript, graph-audit section.
- Graph Evidence Audit text and table: current manuscript, graph-audit section.
- A/B/C tier description: current manuscript, graph-audit section.

Current text that is now factually outdated:

- Earlier manuscript drafts contained an incomplete graph-recovery limitation; the current manuscript and this release contain the verified export.

The original/current structural comparison found that all 26 original citation keys are still present. The only original LaTeX label missing from the CAIT manuscript is `tab:kg_audit`. The other substantive row-level deletion is the KG-local row in `tab:explain`; that row should not be restored as an empirical result because its explanation values were assigned as constants in code.

## Items that remain qualified or incomplete

- `neo4j_import_verification.txt` is a stale pre-optimization snapshot with 46 rules and 31 cues. The final 54-rule/37-cue Neo4j import CSV bundle exists, but no final live-database count log was found. Claims should rely on the verified export unless a new Neo4j import is run.
- `KG_v2_effect_evaluation.md` contains the pre-optimization 0.660/0.510 result, while the CSV and optimization report contain the final 0.956/0.864 result. Cite the CSV plus optimization report and describe the before/after history explicitly.
- The dedicated rule-optimization driver that generated the final evaluation CSV was not found. The final candidate table is sufficient to recompute every published audit cell, and the graph itself rebuilds, but the exact search/edit history is not executable end-to-end from one script.
- Several authority-source entries still say page or edition verification is required. Structural traceability is present; bibliographic page verification is a separate unfinished task.
- The original KG-local explanation-table values of 1.0 for cue grounding, path stability, and reason stability and 0.0 for overconfident error are constants assigned in `src\llm_explanation_audit.py`, not repeated empirical measurements. Preserve the deterministic-state argument in prose, but do not present those constants as measured outcomes.
