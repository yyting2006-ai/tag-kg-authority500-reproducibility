# Candidate-Centric Graph Evidence Report

The public graph is the candidate-centric TAG-KG v2 export. It contains 3,100
nodes and 11,110 directed typed edges, including 468 sentence nodes, 500
candidate-span nodes, 1,500 annotation-decision nodes, 500 consensus labels,
54 grammar rules, and 37 diagnostic cues. Structural validation found no
dangling edges and no candidate missing its sentence, consensus label,
cleaning status, three annotation decisions, or diagnostic cue.

The release includes `kg_v2_nodes.csv`, `kg_v2_edges.csv`, `kg_v2_graph.json`,
`kg_v2_candidate_instances.csv`, `KG_v2_failure_audit.csv`, integrity summaries,
effect tables, query examples, and `verify_candidate_audit.py`. The graph and
candidate tables retain identifiers, sentence text, spans, structured labels,
quality/evaluation status, rule matches, and provenance fields. Free-text
annotator comments and uncertainty notes are omitted; rater IDs are
anonymized.

## Interpretation

The reported 0.956 coverage, 0.864 all-record agreement, and 0.904 agreement
among covered records are construction-set audit statistics. Rules and cues
were developed on these same 500 records. These values are not held-out
predictive performance. Predictive performance is reported from the
sentence-grouped Primary-477 experiments in `../results/`.

The export is structurally verified and can be inspected without Neo4j. No
final live-Neo4j import count log is included. Several authority-source entries
still require edition/page verification; see `../data/authority_sources.csv`.

## Recompute

Run `python verify_candidate_audit.py` in this directory to recompute the
candidate-level coverage and agreement table from the public candidate data.

