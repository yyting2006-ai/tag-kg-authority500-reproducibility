# Authority500-Full model upgrade

This directory contains the isolated model-upgrade experiment. It does not edit
the submission's `main.tex`.

## Registered-candidate protocol

- The source is `authority500_full_{sentences,gold_annotations}.jsonl`.
- The 477 records whose `evaluation_status` is `纳入477条一致评测集` form the
  Primary477 registry (472 unique exact keys after duplicate-key provenance
  merging).
- The 23 `复核/剔除候选` exact keys are ignored in Primary477 train/dev/test.
  A candidate at an ignored key is neither a positive nor a negative example.
- Predictions outside the registered keys are written with
  `UNREGISTERED_UNSCORED_AND_LOGGED`; Authority500-Full is candidate-level and
  is not exhaustive open-span gold.
- Full-500 robustness reuses the frozen Primary477 model and the same prediction
  rows. It does not retrain or retune on the 23 flagged records.

## Reproduce

```powershell
& '.venv\Scripts\python.exe' experiment.py `
  --dataset consistent477 `
  --bootstrap-samples 10000
```

The default package root is resolved portably as
`../original_code_package` relative to `experiment.py`. After extracting the
submission bundle, the command above does not depend on the original
`E:\VScode\...\tmp` workspace. `--package-root` remains available only for an
explicit alternative copy.

The fixed split and all five repeated exact-text-grouped splits are written to
`results/consistent477_primary/splits`. The manifest hashes all inputs, cached
comparison predictions, split IDs, and this script.

Fixed Primary percentile intervals and paired bootstrap tests resample exactly
the 90 fixed-test exact-text sentence groups containing at least one Primary477
registered key (10,000 draws, seed 20260727). The four review-only fixed-test
groups with zero Primary keys are excluded from the sampling universe. See
`BOOTSTRAP_PROTOCOL.md`; the superseded 94-group outputs remain under the
result directory's `protocol_archive` for provenance only.

The two post-hoc cached-prediction analyses can be replayed without fitting a
model or calling an API:

```powershell
& '.venv\Scripts\python.exe' posthoc_cached_analysis.py
```

This command verifies the frozen `experiment.py` hash against the run manifest,
verifies the portable `../original_code_package` sentence, gold, and rule
hashes against that manifest,
then writes the paired LLM-vs-DeepSeek bootstrap, refreshes its section in
`REPORT.md`, and writes the descriptive six-key flagged-only table. Earlier pre-protocol trial outputs were moved to
`stale_preprotocol_outputs`; the only authoritative result directory is
`results/consistent477_primary`.

## Main metrics

- registered exact-span recall;
- conditional label accuracy and macro-F1 on exact emitted registered keys;
- registered labeled-candidate recall;
- macro labeled recall over the four labels;
- unregistered predictions logged (not scored).

Any open-span precision/F1 columns are explicitly prefixed `sensitivity_` and
must not be used as main claims.

## Method names

- `Local-NoInjection`: original local candidate-conditioned form with no gold
  candidate injection and no KG fusion.
- `TAGKG-TrainOnly-Reranker`: local log probabilities plus train-only Laplace
  rule reliability; threshold and alpha are selected on Primary477 dev.
- `TAGKG-FlatRule-Adapter`: the primary local upgrade, combining text
  probabilities with a learned flat rule/cue feature adapter. It is not claimed
  to execute full graph traversal.
- `LLM-Assisted-Stack`: fixed-split optional hybrid. It keeps the local exact
  span output and uses the cached DeepSeek label only when DeepSeek emitted the
  same exact span. It has no test-fitted parameter.

The imported candidate generator and rule inventory were developed in the
broader project. Therefore the split is computationally label-isolated at
runtime, but it is an internally held-out in-domain evaluation rather than an
untouched external test.
