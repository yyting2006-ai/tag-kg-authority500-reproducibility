# TAG-KG 完整性校验报告

- 节点数：3100
- 边数：11110
- 候选片段实例：500
- 唯一句子节点：468

## 完整性检查

- dangling_edges: 0
- candidate_without_sentence: 0
- candidate_without_consensus: 0
- candidate_without_cleaning_status: 0
- candidate_without_three_annotations: 0
- candidate_without_any_cue: 0

## 候选实例质量分层

- B_边界复核集: 250
- A_主评测候选: 133
- C_暂不纳入主实验: 117

## 说明

如果 `dangling_edges`、缺失句子、缺失共识标签、缺失清洗状态或缺失三人标注均为 0，说明 TAG-KG 的核心实例层是连通且可审计的。