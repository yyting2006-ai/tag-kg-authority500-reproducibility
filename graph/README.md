# Recovered TAG-KG v2 evidence bundle

This directory preserves the complete candidate-centric graph recovered from
the local research workspace.  It supplements the smaller rule-centric graph
that was present in the original V5 submission archive.

## Verified scope

- 3,100 nodes and 11,110 directed typed edges
- 468 sentence nodes and 500 candidate-span nodes
- 1,500 annotation decisions, 500 consensus labels
- 54 grammar rules and 37 diagnostic cues
- no dangling edge and no candidate missing its sentence, consensus label,
  cleaning status, three annotation decisions, or diagnostic cue

`EVIDENCE_REPORT.md` gives the independent rebuild, audit recomputation, file
provenance, caveats, and SHA256 hashes.  `verify_candidate_audit.py` recomputes
the candidate-level coverage and agreement table.

## Interpretation warning

The values 0.956 coverage, 0.864 all-record agreement, and 0.904 agreement
among covered records are construction/resubstitution audit statistics.  The
rule and cue layer was revised on the same 500-record collection, so these
numbers must not be presented as held-out predictive performance.  The
sentence-grouped experiments in the paper are the predictive evaluation.

The final CSV/JSON export is structurally verified.  The archived
`neo4j_import_verification.txt` is an older live-database snapshot with 46
rules and 31 cues; it does not verify the final 54-rule/37-cue live import.
