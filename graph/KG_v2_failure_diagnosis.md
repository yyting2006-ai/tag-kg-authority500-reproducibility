# TAG-KG Failure Diagnosis After Rule-Layer Optimization

## Bottom line
The earlier TAG-KG rule layer was not acceptable as a classifier: full-set rule accuracy was 0.510, below the majority-class baseline of 0.670. After modifying only the KG evidence layer (diagnostic cues + GrammarRule entries), full-set rule accuracy increased to 0.864 and coverage increased to 0.956.

## What was fixed
1. Explicit temporal attributives with 的 are now given priority over general temporal-adverbial rules.
2. Noun-phrase-internal temporal modifiers are now detected by expanded nominal-head cues.
3. Post-verbal duration complements are now detected by broader duration-after-predicate cues.
4. Non-target temporal expressions in comparison/state contexts are blocked before adverbial defaults apply.
5. Review-risk non-target candidates are represented as KG evidence rather than silently forced into temporal-adverbial labels.
6. Default temporal-adverbial rules were added for frequency expressions and ordinary temporal nouns, but with lower priority than ATTRIBUTE/COMPLEMENT/OTHER boundary rules.

## Remaining weakness
The remaining errors are mainly temporal-adverbial cases that are unsupported or overruled by stronger boundary rules. The KG is now usable as a rule-evidence classifier over Authority500, but the result should still be reported as rule-layer optimization on the current dataset, not as proof of generalization to all Chinese pedagogical materials.
