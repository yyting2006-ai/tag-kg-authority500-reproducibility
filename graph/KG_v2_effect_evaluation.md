# TAG-KG Effect Evaluation

## Main quantitative findings

| slice                         |   n |   coverage |   acc_all |   acc_covered |   covered_n |   macro_f1_all |
|:------------------------------|----:|-----------:|----------:|--------------:|------------:|---------------:|
| All                           | 500 |      0.660 |     0.510 |         0.773 |         330 |          0.237 |
| A: main-evaluation candidates | 133 |      0.872 |     0.850 |         0.974 |         116 |          0.184 |
| B: boundary challenge         | 250 |      0.624 |     0.496 |         0.795 |         156 |          0.229 |
| C: review-only                | 117 |      0.496 |     0.154 |         0.310 |          58 |          0.184 |

## Interpretation

- TAG-KG is strong on high-agreement A candidates: rule evidence covers 87.2% of instances and agrees with the majority label for 97.4% of covered cases; counting uncovered cases as unsupported yields 84.96% top-rule accuracy.
- It is not a strong full-coverage classifier over all 500 instances: full-set coverage is 66.0% and all-instance top-rule accuracy is 51.0%.
- Its value is therefore evidence auditing, quality stratification, and high-precision adjudication for clean candidates, not replacing the local classifier or expert review.
- The sharp drop on C candidates is desirable as a diagnostic signal: many C cases are span-boundary errors, disagreement cases, or source-verification problems and should not be used for headline evaluation.