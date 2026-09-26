CREATE CONSTRAINT sentence_id_unique IF NOT EXISTS
FOR (s:Sentence)
REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT candidate_span_id_unique IF NOT EXISTS
FOR (c:CandidateSpan)
REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT annotation_decision_id_unique IF NOT EXISTS
FOR (a:AnnotationDecision)
REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT consensus_label_id_unique IF NOT EXISTS
FOR (c:ConsensusLabel)
REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT grammar_rule_id_unique IF NOT EXISTS
FOR (r:GrammarRule)
REQUIRE r.id IS UNIQUE;

CREATE CONSTRAINT diagnostic_cue_id_unique IF NOT EXISTS
FOR (c:DiagnosticCue)
REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT authority_source_id_unique IF NOT EXISTS
FOR (a:AuthoritySource)
REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT syntactic_function_id_unique IF NOT EXISTS
FOR (f:SyntacticFunction)
REQUIRE f.id IS UNIQUE;

CREATE CONSTRAINT ambiguity_type_id_unique IF NOT EXISTS
FOR (a:AmbiguityType)
REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT cleaning_status_id_unique IF NOT EXISTS
FOR (c:CleaningStatus)
REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT cypher_template_id_unique IF NOT EXISTS
FOR (q:CypherQueryTemplate)
REQUIRE q.id IS UNIQUE;

