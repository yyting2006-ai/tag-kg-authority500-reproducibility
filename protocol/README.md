# Authority500-Full non-destructive protocol

Run from any directory with Python 3.10+:

```powershell
python data_protocol/build_data_protocol.py
```

The script reads (but never rewrites) the source files under
`original_code_package/data`, verifies their SHA-256
before and after the run, and regenerates all files beneath this directory.

Start with `DATA_PROTOCOL_REPORT.md`.  Machine consumers should use:

- `manifests/primary477_records.jsonl` for train/dev/test candidate labels;
- `masks/primary_candidate_evaluation_masks.jsonl` for score/ignore/unscored
  span handling;
- `masks/fold_purged_predictor_visibility.jsonl` to prevent gold graph-edge
  and annotation-metadata leakage;
- `manifests/full500_records.jsonl` only for status-stratified robustness
  after the model and thresholds have been frozen.

The source is candidate-centric, not exhaustively open-span annotated.
Unregistered predictions are therefore logged for adjudication and are not
automatically counted as false positives in the Primary-477 metric.
