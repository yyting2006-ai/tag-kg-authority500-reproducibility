# Final registered-candidate experiment report

All learned parameters and decision policies use Primary477 train/dev labels only. The fixed test is accessed only for final metrics. Exact flagged keys are ignored; unmatched predictions are logged but not scored.

## Primary477 fixed test

| method | registered_exact_span_recall | conditional_label_acc | conditional_label_macro_f1 | registered_labeled_candidate_recall | macro_labeled_recall | n_unmatched_predictions_logged |
| --- | --- | --- | --- | --- | --- | --- |
| Local-NoInjection | 0.9896 | 0.7579 | 0.4111 | 0.7500 | 0.3646 | 15 |
| TAGKG-TrainOnly-Reranker | 0.9896 | 0.8421 | 0.6508 | 0.8333 | 0.6250 | 16 |
| TAGKG-FlatRule-Adapter | 0.9896 | 0.8526 | 0.7125 | 0.8438 | 0.7010 | 15 |
| DeepSeek-5shot | 0.9583 | 0.9022 | 0.8248 | 0.8646 | 0.7494 | 37 |
| Qwen-5shot | 0.8958 | 0.8605 | 0.7422 | 0.7708 | 0.7096 | 31 |
| GPT4oMini-5shot | 0.8854 | 0.7529 | 0.5259 | 0.6667 | 0.5938 | 32 |
| LLM-Assisted-Stack | 0.9896 | 0.8842 | 0.7874 | 0.8750 | 0.7531 | 15 |

## Full-500 locked-model robustness

| method | registered_exact_span_recall | conditional_label_acc | conditional_label_macro_f1 | registered_labeled_candidate_recall | macro_labeled_recall | n_unmatched_predictions_logged |
| --- | --- | --- | --- | --- | --- | --- |
| Local-NoInjection | 0.9706 | 0.7273 | 0.3884 | 0.7059 | 0.3515 | 15 |
| TAGKG-TrainOnly-Reranker | 0.9804 | 0.8000 | 0.6299 | 0.7843 | 0.6076 | 16 |
| TAGKG-FlatRule-Adapter | 0.9706 | 0.8182 | 0.6787 | 0.7941 | 0.6740 | 15 |
| DeepSeek-5shot | 0.9412 | 0.8854 | 0.8176 | 0.8333 | 0.7273 | 37 |
| Qwen-5shot | 0.8824 | 0.8333 | 0.7116 | 0.7353 | 0.6850 | 31 |
| GPT4oMini-5shot | 0.8627 | 0.7273 | 0.5008 | 0.6275 | 0.5729 | 32 |
| LLM-Assisted-Stack | 0.9706 | 0.8485 | 0.7396 | 0.8235 | 0.7016 | 15 |

## Five repeated exact-text-grouped splits (mean and SD)

| method | n_runs | registered_exact_span_recall_mean | registered_exact_span_recall_std | conditional_label_acc_mean | conditional_label_acc_std | conditional_label_macro_f1_mean | conditional_label_macro_f1_std | registered_labeled_candidate_recall_mean | registered_labeled_candidate_recall_std | macro_labeled_recall_mean | macro_labeled_recall_std |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Local-NoInjection | 5 | 0.9578 | 0.0200 | 0.7565 | 0.0240 | 0.3646 | 0.0364 | 0.7243 | 0.0174 | 0.3374 | 0.0224 |
| TAGKG-FlatRule-Adapter | 5 | 0.9578 | 0.0200 | 0.8838 | 0.0201 | 0.7280 | 0.0533 | 0.8465 | 0.0230 | 0.7126 | 0.0546 |
| TAGKG-TrainOnly-Reranker | 5 | 0.9599 | 0.0205 | 0.8666 | 0.0261 | 0.6677 | 0.0385 | 0.8317 | 0.0254 | 0.6587 | 0.0606 |

## Fixed ablation weights

- TAGKG-FlatRule-Adapter: weights=[1.0, 0.0, 1.0, 0.0, 0.0]; label_bias=[0.0, 0.0, 0.0, 0.0].
- TAGKG-RuleFeature-Stack: weights=[1.0, 0.0, 2.0, 2.0, 0.0]; label_bias=[0.0, 0.0, 0.0, 0.0].

## Fixed Primary paired bootstrap

The fixed Primary inference resamples 90 exact-text sentence groups containing at least one Primary registered test key (10,000 draws; seed 20260727). The 4 review-only fixed-test groups with zero Primary keys are excluded. Point estimates are unchanged. Holm adjustment controls all 16 adapter-versus-reference metric comparisons in this table.

| reference | metric | difference | ci95_low | ci95_high | raw_p | holm_p |
| --- | --- | --- | --- | --- | --- | --- |
| Local-NoInjection | registered_exact_span_recall | 0.0000 | 0.0000 | 0.0000 | 1.0000 | 1.0000 |
| Local-NoInjection | registered_labeled_candidate_recall | 0.0938 | 0.0217 | 0.1684 | 0.0150 | 0.2100 |
| Local-NoInjection | macro_labeled_recall | 0.3364 | 0.2172 | 0.4463 | 0.0002 | 0.0032 |
| Local-NoInjection | conditional_label_macro_f1 | 0.3014 | 0.1653 | 0.4495 | 0.0002 | 0.0032 |
| TAGKG-TrainOnly-Reranker | registered_exact_span_recall | 0.0000 | 0.0000 | 0.0000 | 1.0000 | 1.0000 |
| TAGKG-TrainOnly-Reranker | registered_labeled_candidate_recall | 0.0104 | -0.0323 | 0.0543 | 0.8233 | 1.0000 |
| TAGKG-TrainOnly-Reranker | macro_labeled_recall | 0.0760 | -0.0071 | 0.1878 | 0.1056 | 1.0000 |
| TAGKG-TrainOnly-Reranker | conditional_label_macro_f1 | 0.0617 | -0.0225 | 0.1675 | 0.1922 | 1.0000 |
| DeepSeek-5shot | registered_exact_span_recall | 0.0312 | 0.0000 | 0.0722 | 0.0964 | 1.0000 |
| DeepSeek-5shot | registered_labeled_candidate_recall | -0.0208 | -0.0851 | 0.0421 | 0.6217 | 1.0000 |
| DeepSeek-5shot | macro_labeled_recall | -0.0484 | -0.1517 | 0.0742 | 0.3944 | 1.0000 |
| DeepSeek-5shot | conditional_label_macro_f1 | -0.1123 | -0.2605 | 0.0709 | 0.2066 | 1.0000 |
| LLM-Assisted-Stack | registered_exact_span_recall | 0.0000 | 0.0000 | 0.0000 | 1.0000 | 1.0000 |
| LLM-Assisted-Stack | registered_labeled_candidate_recall | -0.0312 | -0.0938 | 0.0309 | 0.3938 | 1.0000 |
| LLM-Assisted-Stack | macro_labeled_recall | -0.0521 | -0.1545 | 0.0704 | 0.3608 | 1.0000 |
| LLM-Assisted-Stack | conditional_label_macro_f1 | -0.0749 | -0.2071 | 0.0935 | 0.3540 | 1.0000 |

## Cached post-hoc comparison: LLM-Assisted-Stack vs DeepSeek-5shot

The following paired percentile intervals use 10,000 exact-text-group bootstrap resamples of the 90 fixed-test groups containing at least one Primary registered key (seed 20260727). The four review-only groups with zero Primary keys are excluded. This is a post-hoc comparison of frozen cached predictions: no model was fitted or tuned and no API was called. The Holm column controls the four metrics in this comparison.

| metric | LLM-Assisted-Stack | DeepSeek-5shot | difference | paired 95% CI | raw p | Holm p |
| --- | --- | --- | --- | --- | --- | --- |
| registered labeled candidate recall | 0.8750 | 0.8646 | +0.0104 | [0.0000, 0.0323] | 0.7441 | 1.0000 |
| macro labeled recall | 0.7531 | 0.7494 | +0.0037 | [0.0000, 0.0119] | 0.7441 | 1.0000 |
| registered exact-span recall | 0.9896 | 0.9583 | +0.0312 | [0.0000, 0.0722] | 0.0964 | 0.3856 |
| conditional label macro-F1 | 0.7874 | 0.8248 | -0.0374 | [-0.1005, 0.0004] | 0.2622 | 0.7865 |

None of the four paired 95% intervals excludes zero. The hybrid therefore has favorable point estimates for registered coverage and end-to-end labeled recall, but the small fixed test does not support a claim of statistical superiority over DeepSeek.

## Flagged-only fixed-test robustness

These six registry keys were excluded from Primary477 train/dev/test decisions and are reported descriptively only. Macro metrics are intentionally omitted because the subset is too small.

| method | exact matches / 6 | registered exact-span recall | labeled correct / 6 | registered labeled candidate recall |
| --- | --- | --- | --- | --- |
| Local-NoInjection | 4 / 6 | 0.6667 | 0 / 6 | 0.0000 |
| TAGKG-TrainOnly-Reranker | 5 / 6 | 0.8333 | 0 / 6 | 0.0000 |
| TAGKG-FlatRule-Adapter | 4 / 6 | 0.6667 | 0 / 6 | 0.0000 |
| DeepSeek-5shot | 4 / 6 | 0.6667 | 2 / 6 | 0.3333 |
| LLM-Assisted-Stack | 4 / 6 | 0.6667 | 0 / 6 | 0.0000 |

## Interpretation limits

The KG branch is a flat rule/cue feature adapter derived from the TAG-KG inventory, not an executed graph-traversal experiment. The imported candidate generator and rules predate this rerun but were developed inside the broader project, so the evaluation is internally held out rather than an untouched external benchmark.

The historical contaminated KG-local artifact is retained only in CSV audit tables and is excluded from bootstrap and significance comparisons.
