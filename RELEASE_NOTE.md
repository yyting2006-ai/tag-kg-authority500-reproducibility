# Release note

Version 1.0.0 publishes the rights-cleared Authority500-Full sentence records, a de-identified adjudication table, the verified candidate-centric graph export, and fixed/repeated evaluation artifacts for the TAG-KG journal extension.

The release covers 468 sentence groups and 500 candidate records. It retains stable sentence and candidate identifiers, character offsets, labels, consensus/status fields, quality tiers, and source provenance. The CSV and XLSX files are convenience views of the adjudicated JSONL records.

Annotator names, contact details, free-text comments, timestamps from private annotation logistics, source scans, API keys, service credentials, and cached model binaries are excluded. The graph export retains only anonymized rater identifiers and structured labels needed for integrity counts; internal comments and uncertainty notes are removed. The release also excludes unrelated ICALT2027 annotation returns and earlier COLING experimental packages. The current journal claims are tied to the CAIT full-author evidence ledger and the files in `paper/`.

Source records retain their provenance and verification-status fields. Users should preserve those fields in derived releases and should verify the governing licence before redistributing any source-specific material. Where a source sentence cannot be redistributed, its stable identifier and derived annotation remain the appropriate public record.
