// TAG-KG Neo4j import script. Put CSV files from neo4j_import/ into Neo4j import directory first.
MATCH (n) DETACH DELETE n;

LOAD CSV WITH HEADERS FROM 'file:///nodes_AmbiguityType.csv' AS row
MERGE (n:AmbiguityType {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_AnnotationDecision.csv' AS row
MERGE (n:AnnotationDecision {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_Annotator.csv' AS row
MERGE (n:Annotator {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_AuthoritySource.csv' AS row
MERGE (n:AuthoritySource {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_CandidateSpan.csv' AS row
MERGE (n:CandidateSpan {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_CleaningStatus.csv' AS row
MERGE (n:CleaningStatus {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_ConsensusLabel.csv' AS row
MERGE (n:ConsensusLabel {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_CypherQueryTemplate.csv' AS row
MERGE (n:CypherQueryTemplate {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_DiagnosticCue.csv' AS row
MERGE (n:DiagnosticCue {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_GrammarRule.csv' AS row
MERGE (n:GrammarRule {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_Sentence.csv' AS row
MERGE (n:Sentence {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///nodes_SyntacticFunction.csv' AS row
MERGE (n:SyntacticFunction {id: row.id})
SET n += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_ACTIVATES_RULE.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:ACTIVATES_RULE]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_ANNOTATED_BY.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:ANNOTATED_BY]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_CAN_QUERY.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:CAN_QUERY]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_CITES.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:CITES]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_DERIVED_FROM.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:DERIVED_FROM]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_HAS_AMBIGUITY.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:HAS_AMBIGUITY]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_HAS_CANDIDATE.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:HAS_CANDIDATE]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_HAS_CLEANING_STATUS.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:HAS_CLEANING_STATUS]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_HAS_CONSENSUS.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:HAS_CONSENSUS]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_MADE_BY.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:MADE_BY]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_MAPS_TO.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:MAPS_TO]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_MATCHES_RULE.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:MATCHES_RULE]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_SUPPORTS_FUNCTION.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:SUPPORTS_FUNCTION]->(t)
SET r += row;

LOAD CSV WITH HEADERS FROM 'file:///edges_TRIGGERS_CUE.csv' AS row
MATCH (s {id: row.source})
MATCH (t {id: row.target})
MERGE (s)-[r:TRIGGERS_CUE]->(t)
SET r += row;
