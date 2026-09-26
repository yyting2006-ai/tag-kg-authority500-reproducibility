# TAG-KG 构建报告

## 与旧版网页的区别

旧版网页主要展示规则表中的节点和关系。TAG-KG 将 500 个候选时间片段实例、468 个唯一句子、三人标注决策、多数一致标签、清洗状态、歧义类型、诊断线索、语法规则和权威来源统一建模。

## 图谱规模

- 节点总数：3100
- 边总数：11110
- 候选实例：500
- 唯一句子：468

## 节点类型

- AmbiguityType: 16
- AnnotationDecision: 1500
- Annotator: 3
- AuthoritySource: 10
- CandidateSpan: 500
- CleaningStatus: 3
- ConsensusLabel: 500
- CypherQueryTemplate: 3
- DiagnosticCue: 37
- GrammarRule: 54
- Sentence: 468
- SyntacticFunction: 6

## 关系类型

- ACTIVATES_RULE: 127
- ANNOTATED_BY: 1500
- CAN_QUERY: 6
- CITES: 185
- DERIVED_FROM: 468
- HAS_AMBIGUITY: 1690
- HAS_CANDIDATE: 500
- HAS_CLEANING_STATUS: 500
- HAS_CONSENSUS: 500
- MADE_BY: 1500
- MAPS_TO: 500
- MATCHES_RULE: 1519
- SUPPORTS_FUNCTION: 54
- TRIGGERS_CUE: 2061

## 数据质量控制

- C_暂不纳入主实验: 117
- A_主评测候选: 133
- B_边界复核集: 250

## 论文中建议表述

本文构建的是证据型语法知识图谱，而不是单纯关系图。图谱以候选时间片段为中心，连接句子出处、三人标注、多数一致标签、清洗分层、歧义风险、诊断线索、语法规则和权威依据，用于支持可追溯的时间状语功能诊断。