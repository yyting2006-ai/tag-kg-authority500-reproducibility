// 1. 查询一个候选时间片段的完整证据链
MATCH (s:Sentence)-[:HAS_CANDIDATE]->(c:CandidateSpan {span_id: "AUTH-TAD-0003"})
OPTIONAL MATCH (c)-[:HAS_CONSENSUS]->(label:ConsensusLabel)-[:MAPS_TO]->(func:SyntacticFunction)
OPTIONAL MATCH (c)-[:HAS_CLEANING_STATUS]->(status:CleaningStatus)
OPTIONAL MATCH (c)-[:HAS_AMBIGUITY]->(amb:AmbiguityType)
OPTIONAL MATCH (c)-[:TRIGGERS_CUE]->(cue:DiagnosticCue)
OPTIONAL MATCH (c)-[:MATCHES_RULE]->(rule:GrammarRule)-[:CITES]->(src:AuthoritySource)
RETURN s.text AS sentence,
       c.text AS candidate_span,
       label.final_function AS final_function,
       status.tier AS cleaning_tier,
       collect(DISTINCT amb.name) AS ambiguity_types,
       collect(DISTINCT cue.cue_id) AS cues,
       collect(DISTINCT rule.rule_id) AS matched_rules,
       collect(DISTINCT src.label) AS authority_sources;

// 2. 只取可进入主实验的高一致候选实例
MATCH (s:Sentence)-[:HAS_CANDIDATE]->(c:CandidateSpan)-[:HAS_CLEANING_STATUS]->(st:CleaningStatus)
WHERE st.tier = "A_主评测候选"
MATCH (c)-[:HAS_CONSENSUS]->(label:ConsensusLabel)
RETURN c.span_id AS id, s.text AS sentence, c.text AS span, label.final_function AS final_function
ORDER BY id;

// 3. 查询同句多候选，检查训练/测试泄漏风险
MATCH (s:Sentence)-[:HAS_CANDIDATE]->(c:CandidateSpan)
WITH s.sentence_id AS sentence_group, s.text AS sentence, collect(c.span_id) AS spans, count(c) AS n
WHERE n > 1
RETURN sentence_group, sentence, spans, n
ORDER BY n DESC;

// 4. 查询需要优先复核的 C 类实例
MATCH (s:Sentence)-[:HAS_CANDIDATE]->(c:CandidateSpan)-[:HAS_CLEANING_STATUS]->(st:CleaningStatus)
WHERE st.tier = "C_暂不纳入主实验"
OPTIONAL MATCH (c)-[:HAS_AMBIGUITY]->(a:AmbiguityType)
RETURN c.span_id AS id, s.text AS sentence, c.text AS span,
       collect(a.name) AS ambiguity_types
ORDER BY id;

// 5. 查询某条语法规则覆盖了哪些候选片段
MATCH (c:CandidateSpan)-[m:MATCHES_RULE]->(r:GrammarRule {rule_id: "R_TEMP_ADV_01"})
MATCH (s:Sentence)-[:HAS_CANDIDATE]->(c)
OPTIONAL MATCH (c)-[:HAS_CONSENSUS]->(label:ConsensusLabel)
RETURN c.span_id AS id, s.text AS sentence, c.text AS span,
       label.final_function AS final_function, m.agrees_with_consensus AS agrees
ORDER BY id;

