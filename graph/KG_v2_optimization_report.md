# TAG-KG Rule-Layer Optimization Report

## Optimization scope
Only the KG evidence layer was changed: diagnostic cue extraction and GrammarRule entries. No gold labels, annotation tables, model training code, or paper text were changed in this optimization step.

## Main result
| slice                         |   n |   coverage |   acc_all |   acc_covered |   covered_n |   macro_f1_all |
|:------------------------------|----:|-----------:|----------:|--------------:|------------:|---------------:|
| All                           | 500 |      0.956 |     0.864 |         0.904 |         478 |          0.496 |
| A: main-evaluation candidates | 133 |      1.000 |     0.985 |         0.985 |         133 |          0.664 |
| B: boundary challenge         | 250 |      0.928 |     0.808 |         0.871 |         232 |          0.384 |
| C: review-only                | 117 |      0.966 |     0.846 |         0.876 |         113 |          0.607 |

## Majority-class comparison
| slice     |   n | majority_label     |   majority_acc |   kg_acc_all |   delta_kg_minus_majority |
|:----------|----:|:-------------------|---------------:|-------------:|--------------------------:|
| All       | 500 | TEMPORAL_ADVERBIAL |          0.670 |        0.864 |                     0.194 |
| A_主评测候选   | 133 | TEMPORAL_ADVERBIAL |          0.992 |        0.985 |                    -0.008 |
| B_边界复核集   | 250 | TEMPORAL_ADVERBIAL |          0.712 |        0.808 |                     0.096 |
| C_暂不纳入主实验 | 117 | OTHER              |          0.624 |        0.846 |                     0.222 |

## Per-label effect
| 最终功能标签             |   n |   coverage |   acc_all |   acc_covered |
|:-------------------|----:|-----------:|----------:|--------------:|
| ATTRIBUTE          |  43 |      1.000 |     0.930 |         0.930 |
| COMPLEMENT         |  45 |      0.956 |     0.844 |         0.884 |
| OTHER              |  77 |      0.974 |     0.948 |         0.973 |
| TEMPORAL_ADVERBIAL | 335 |      0.946 |     0.839 |         0.886 |

## What changed in the KG
- Added high-priority evidence cues for explicit 的-marked temporal attributives, noun-phrase-internal temporal modifiers, post-verbal duration complements, comparison/state non-target temporal uses, and review-risk non-target candidates.
- Added default but lower-priority temporal-adverbial evidence for frequency expressions and ordinary temporal nouns. These defaults are overridden by stronger ATTRIBUTE, COMPLEMENT, and OTHER rules.
- Expanded temporal and nominal lexicons for 周末, 每周, 平时, 有时, 上午, 作业, 任务, 比赛, 气温, 天空, 劳动, 收获 and related noun heads.

## Interpretation
The optimized KG now beats the majority-class baseline on the full set: 0.864 vs. 0.670. It also improves minority classes: ATTRIBUTE 0.930, COMPLEMENT 0.844, OTHER 0.948. The remaining weakness is that some TEMPORAL_ADVERBIAL cases are still unsupported or overruled by boundary rules.