# Authority500-Full 数据协议审计报告

协议版本：`authority500-data-protocol-v1.0`

## 结论

- 原始文件保持不变；脚本只读取源数据并在本目录生成 manifest、mask 与审计结果。
- Primary-477 仅包含 `evaluation_status == 纳入477条一致评测集` 的 477 个候选记录。
- Full-500 保留全部 500 个候选；其中 23 个 `复核/剔除候选` 只作为冻结模型后的、按状态分层的稳健性材料，不能参与训练或调参。
- 过滤后 Primary-477 覆盖 458 个句组；另有 10 个句组只含复核候选，仍保留在逐句 mask 中但不进入主指标。
- 共识与复核候选共存于 13 个混合句组；完整句子可作上下文，但必须逐候选屏蔽监督与计分。
- 该语料是候选级标注，并无证据表明句内所有潜在时间 span 已穷举。因此主指标必须按注册候选计分：复核候选屏蔽，未匹配到注册候选的预测只记录为 `UNSCORED_AND_LOGGED`，不能自动计为 FP。
- 若要报告开放式 span precision/F1，必须另做穷举式 span 标注或人工裁决 unmatched predictions；本协议明确禁止直接用当前 500 条候选级数据宣称开放抽取 precision。

## 数据量与分层

### primary477

| split | raw候选 | unique candidate | 句组 | unique text | review | mixed句组 | 类别计数 | tier计数 |
|---|---:|---:|---:|---:|---:|---:|---|---|
| train | 286 | 286 | 275 | 275 | 0 | 9 | ATTRIBUTE=23; COMPLEMENT=27; OTHER=37; TEMPORAL_ADVERBIAL=199 | A_主评测候选=79; B_边界复核集=152; C_暂不纳入主实验=55 |
| dev | 93 | 93 | 93 | 93 | 0 | 2 | ATTRIBUTE=8; COMPLEMENT=9; OTHER=12; TEMPORAL_ADVERBIAL=64 | A_主评测候选=23; B_边界复核集=50; C_暂不纳入主实验=20 |
| test | 98 | 98 | 90 | 90 | 0 | 2 | ATTRIBUTE=8; COMPLEMENT=8; OTHER=14; TEMPORAL_ADVERBIAL=68 | A_主评测候选=31; B_边界复核集=48; C_暂不纳入主实验=19 |
| all | 477 | 477 | 458 | 458 | 0 | 13 | ATTRIBUTE=39; COMPLEMENT=44; OTHER=63; TEMPORAL_ADVERBIAL=331 | A_主评测候选=133; B_边界复核集=250; C_暂不纳入主实验=94 |

### full500

| split | raw候选 | unique candidate | 句组 | unique text | review | mixed句组 | 类别计数 | tier计数 |
|---|---:|---:|---:|---:|---:|---:|---|---|
| train | 300 | 300 | 280 | 280 | 14 | 9 | ATTRIBUTE=27; COMPLEMENT=27; OTHER=45; TEMPORAL_ADVERBIAL=201 | A_主评测候选=79; B_边界复核集=152; C_暂不纳入主实验=69 |
| dev | 96 | 96 | 94 | 94 | 3 | 2 | ATTRIBUTE=8; COMPLEMENT=9; OTHER=13; TEMPORAL_ADVERBIAL=66 | A_主评测候选=23; B_边界复核集=50; C_暂不纳入主实验=23 |
| test | 104 | 104 | 94 | 94 | 6 | 2 | ATTRIBUTE=8; COMPLEMENT=9; OTHER=19; TEMPORAL_ADVERBIAL=68 | A_主评测候选=31; B_边界复核集=48; C_暂不纳入主实验=25 |
| all | 500 | 500 | 468 | 468 | 23 | 13 | ATTRIBUTE=43; COMPLEMENT=45; OTHER=77; TEMPORAL_ADVERBIAL=335 | A_主评测候选=133; B_边界复核集=250; C_暂不纳入主实验=117 |

## 混合一致/复核候选的句组

下列句组不能在过滤 23 条后按普通完整 BIO 序列训练或评估；否则同句被屏蔽的候选会被错误地变成 `O` 或 FP。

| split | SID | 句子 | Primary-477候选 | 屏蔽候选 |
|---|---|---|---|---|
| dev | SENT-0044 | 今天就可以动手，何必明天呢? | AUTH-TAD-0263:今天[0,2)/TEMPORAL_ADVERBIAL | AUTH-TAD-0038:明天[10,12)/TEMPORAL_ADVERBIAL |
| train | SENT-0063 | 今年公司的总利润比去年降低了不少。 | AUTH-TAD-0368:今年[0,2)/TEMPORAL_ADVERBIAL | AUTH-TAD-0239:去年[9,11)/ATTRIBUTE |
| train | SENT-0065 | 今年生产的产品数量比去年增加了百分之四十。 | AUTH-TAD-0420:今年[0,2)/TEMPORAL_ADVERBIAL | AUTH-TAD-0218:去年[10,12)/OTHER |
| train | SENT-0105 | 他未免过分自信了，平时考试他都在第十名以后。 | AUTH-TAD-0122:考试他都在第十名以后[11,21)/OTHER | AUTH-TAD-0419:平时[9,11)/ATTRIBUTE |
| train | SENT-0169 | 别担心，她告诉我今天家里有事，请了半天假。 | AUTH-TAD-0369:今天[8,10)/TEMPORAL_ADVERBIAL | AUTH-TAD-0004:半天[17,19)/TEMPORAL_ADVERBIAL |
| train | SENT-0170 | 别提了，我昨天怎么也睡不着，看了一晚上的电视。 | AUTH-TAD-0083:昨天[5,7)/TEMPORAL_ADVERBIAL | AUTH-TAD-0328:晚上[17,19)/OTHER |
| train | SENT-0198 | 在这三年里，我把每天跑步这个习惯坚持下来了。 | AUTH-TAD-0366:每天[8,10)/TEMPORAL_ADVERBIAL | AUTH-TAD-0329:三年[2,4)/OTHER |
| test | SENT-0246 | 已经十一点了，快睡吧。 | AUTH-TAD-0288:已经[0,2)/TEMPORAL_ADVERBIAL | AUTH-TAD-0302:十一点[2,5)/OTHER |
| dev | SENT-0247 | 已经快九点了，我连忙出门打车。 | AUTH-TAD-0447:已经快九点了[0,6)/OTHER | AUTH-TAD-0398:九点[3,5)/OTHER |
| train | SENT-0320 | 据估计，今年的出口量将超过去年。 | AUTH-TAD-0242:今年[4,6)/ATTRIBUTE | AUTH-TAD-0076:过去[12,14)/OTHER |
| test | SENT-0349 | 昨天写了一晚上作文，今天头疼得厉害。 | AUTH-TAD-0189:昨天[0,2)/TEMPORAL_ADVERBIAL | AUTH-TAD-0414:晚上[5,7)/OTHER |
| train | SENT-0395 | 现在爸爸的精力比过去越发充沛了。 | AUTH-TAD-0098:现在[0,2)/TEMPORAL_ADVERBIAL | AUTH-TAD-0289:过去[8,10)/OTHER |
| train | SENT-0404 | 目前的情况与去年完全不同。 | AUTH-TAD-0294:目前[0,2)/ATTRIBUTE | AUTH-TAD-0092:去年[6,8)/OTHER |

## 推荐的训练、调参与测试协议

1. **冻结句组切分。** 使用现有 `train/dev/test` 的 SENT-ID 分组；禁止把同句候选拆到不同 split。所有特征统计、规则可靠性、阈值和融合权重只能由 Primary-477 的 train 建立、由 Primary-477 的 dev 选择。
2. **候选级监督。** train 只对 `candidate_label_loss_allowed=true` 的一致候选计算边界/功能分类损失。23 条复核候选全部 `loss mask=0`，既不是正例，也绝不能当负例。混合句组可以保留完整句子作为上下文，但必须按候选 ID 计算损失。被屏蔽候选的 gold function/status/tier/paper_position 不得作为同句其他候选的输入特征。
3. **使用 fold-purged 图视图。** 静态规则、cue 定义和权威来源本体可对所有 split 可见；任何目标候选自身的 gold function、共识、status、tier、paper_position 及其 label-bearing graph edge 都只能由 scorer 读取，不能由 predictor 检索。规则可靠性或融合先验只能用 `aggregate_rule_statistics_source_allowed=true` 的 Primary-477 train 估计；dev/test gold 绝不进入图统计。
4. **不要从本数据直接训练开放式 BIO 检测器。** `char_supervision_state` 中 `R` 和 `U` 都不是 `O`；`U` 表示未注册/未知。开放 span 模块应来自独立的穷举标注语料，或先补齐本语料的全 span 标注。
5. **主测试。** 仅在 test split 且 `primary_test_metric_allowed=true` 的候选上一次性报告候选边界正确率、功能 accuracy/macro-F1、置信区间。复核候选及 unmatched spans 不进入主分母。
6. **Full-500 稳健性。** 冻结模型后，可在 test split 的全部注册候选上做按 `evaluation_status`、tier、class 分层的辅助分析；23 条复核标签必须称为 provisional，不能用于模型选择。若展示 all-500 全切分诊断，应明确为 post-freeze descriptive audit，而非 held-out 性能。
7. **未知预测处理。** primary candidate-conditioned 评估中：匹配一致候选的预测计分；匹配复核候选的预测忽略；未匹配任何注册候选的 span 单列数量/样例并送人工裁决，不自动记 FP。只有在穷举标注完成后才可把经裁决的 unmatched span 纳入开放抽取 precision。
8. **报告双层指标。** 主文以 Primary-477 test 为确认性结果；Full-500 test 为稳健性结果；同时公开被屏蔽数、unmatched prediction 数及人工裁决流程，避免 silent masking。

## 验证结果

- split SID 交叉：0 个。
- NFKC+strip 归一化文本跨 split 交叉：0 个。
- sentence/gold/split 覆盖或 candidate ID 成员不一致：0 个。
- candidate_ids 仅顺序不同、成员完全相同：15 个（notice，不影响按 ID 关联）。
- offset 越界：0 个。
- `sentence[start_char:end_char] != span.text`：0 个。
- error：0 个；notice：15 个。全部发现详见 `validation/issues.jsonl`。

任何非零 offset/text 问题都必须在上游人工确认；本脚本只报告并在 manifest 中标记，绝不静默修正原始标注。

## 生成文件

- `manifests/full500_records.jsonl`：500 条逐候选、可追溯记录。
- `manifests/primary477_records.jsonl`：严格按 evaluation_status 过滤后的 477 条记录。
- `masks/primary_candidate_evaluation_masks.jsonl`：逐句 primary score/ignore 注册表与字符状态。
- `masks/fold_purged_predictor_visibility.jsonl`：逐候选图可见性/标签用途约束。
- `manifests/mixed_status_groups.jsonl` / `.csv`：混合句组清单。
- `summary/protocol_summary.json` / `split_counts.csv`：机器可读统计。
- `validation/issues.jsonl` / `validation_summary.json`：完整性与泄漏审计。
- `source_hashes.json`：运行前后 SHA-256；两者必须相同。

## 源数据

读取目录：`E:\VScode\CAIT2026_Submission\reproducibility\original_code_package\data`

- `authority500_full_sentences.jsonl`: `976e9c168a5a62de27f41f8a968be289ab78d8a4e852845b8531e353fa34dce3`
- `authority500_full_gold_annotations.jsonl`: `850acc49a1f3942bcf6c25d504f004f7021bc8ef119401ad4c2fff879b6e4c29`
- `splits/train.txt`: `edcba040be0bc201f63432cf9a6f4a0f0395d8d3afcc8c742912c5b5f9c86528`
- `splits/dev.txt`: `375b583591fd27a543ba3097665299e06fd2775db0efa6d6c4e54ad75d551fc2`
- `splits/test.txt`: `4d8760425add4dda981a388ba6b19f81dfb9d8acd7bd9ff606f0dc19654170c7`
