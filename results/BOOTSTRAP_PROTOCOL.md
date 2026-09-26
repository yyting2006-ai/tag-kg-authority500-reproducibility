# Fixed Primary bootstrap protocol

## Authoritative protocol (v2)

- Resampling unit: exact sentence-text group.
- Eligibility: the group contains at least one Primary477 registered test key.
- Sampling universe: 90 eligible groups; all are singleton groups in the fixed
  test.
- Excluded from Primary inference: four review-only groups containing zero
  Primary registered keys.
- Draws: 10,000 paired resamples with NumPy seed 20260727.
- Point estimates: computed on the fixed Primary registry and unchanged by the
  exclusion, because the four excluded groups contribute no Primary key.
- Multiplicity: `paired_bootstrap_fixed.csv` applies Holm correction across its
  16 adapter-versus-reference metric comparisons;
  `paired_bootstrap_llm_assisted_vs_deepseek.csv` applies Holm correction across
  its four cached hybrid-versus-DeepSeek metrics.

`experiment.py` asserts the 94/90/4 group counts, singleton group sizes,
prediction/gold SID equality, and equality of point metrics before and after
zero-Primary-group exclusion. `posthoc_cached_analysis.py` independently
asserts the same group universe and verifies the frozen experiment-script hash.

## Superseded protocol (v1)

The earlier calculation sampled all 94 fixed-test groups, inadvertently adding
four zero-information review-only groups to Primary resampling. Its scripts,
CSV outputs, report, manifests, and pre-correction hashes are preserved at:

`results/consistent477_primary/protocol_archive/bootstrap_v1_94_groups_including_review_only_20260727`

That directory is provenance-only and is never read by the authoritative
scripts.
