# Registered-candidate evaluation protocol

Authority500-Full registers candidate exact keys rather than exhaustively
annotating every possible temporal span in a sentence.

For Primary477:

1. A registered key is `(text, start_char, end_char)` with consistent status.
2. An exact flagged/review key is ignored in training and evaluation.
3. A prediction at a registered key contributes to exact-span recall.
4. Conditional label metrics are computed only on emitted registered keys.
5. Registered labeled-candidate recall counts a key as correct only when the
   key is emitted and its four-way label is correct.
6. Macro labeled recall averages per-label recall; missing and wrongly labeled
   registered keys are false negatives for their gold class.
7. Predictions at unregistered keys are logged but not counted as false
   positives, because the benchmark is not exhaustive open extraction gold.

The fixed Primary477 test contains 98 raw records, 96 unique registered keys in
90 positive sentence groups, with unique-key support 68 temporal-adverbial, 8
attribute, 8 complement, and 12 other. The fixed Full-500 robustness test has
104 raw records and 102 unique registered keys in 94 sentence groups.

All fixed Primary bootstrap intervals and paired tests use the 90 positive
exact-text sentence groups as the resampling universe. The four additional
fixed-test groups contain only flagged/review keys and are excluded because
they have zero Primary registered-key support. They remain in the cached
prediction rows and the Full-500 locked-model robustness evaluation.
