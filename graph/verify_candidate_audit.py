from __future__ import annotations

import csv
import hashlib
import json
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parent
CANDIDATES = ROOT / "kg_v2_candidate_instances.csv"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def macro_f1(rows: list[dict[str, str]]) -> float:
    # Match sklearn's default macro average in the archived audit: the label
    # universe is the union of gold labels and every prediction, including
    # the empty string used for an uncovered candidate.
    labels = sorted(
        {row["最终功能标签"] for row in rows}
        | {row["top_rule_function"] for row in rows}
    )
    scores = []
    for label in labels:
        tp = sum(
            row["最终功能标签"] == label and row["top_rule_function"] == label
            for row in rows
        )
        fp = sum(
            row["最终功能标签"] != label and row["top_rule_function"] == label
            for row in rows
        )
        fn = sum(
            row["最终功能标签"] == label and row["top_rule_function"] != label
            for row in rows
        )
        precision = tp / (tp + fp) if tp + fp else 0.0
        recall = tp / (tp + fn) if tp + fn else 0.0
        scores.append(
            2 * precision * recall / (precision + recall)
            if precision + recall
            else 0.0
        )
    return sum(scores) / len(scores)


def summarize(rows: list[dict[str, str]]) -> dict[str, object]:
    n = len(rows)
    covered = [row for row in rows if row["top_rule"]]
    correct = [
        row
        for row in rows
        if row["top_rule"]
        and row["top_rule_function"] == row["最终功能标签"]
    ]
    majority_label, majority_n = Counter(
        row["最终功能标签"] for row in rows
    ).most_common(1)[0]
    return {
        "n": n,
        "covered_n": len(covered),
        "correct_n": len(correct),
        "coverage": len(covered) / n,
        "acc_all": len(correct) / n,
        "acc_covered": len(correct) / len(covered) if covered else 0.0,
        "macro_f1_all": macro_f1(rows),
        "majority_label": majority_label,
        "majority_acc": majority_n / n,
    }


with CANDIDATES.open("r", encoding="utf-8-sig", newline="") as stream:
    candidates = list(csv.DictReader(stream))

tiers: dict[str, list[dict[str, str]]] = {"A": [], "B": [], "C": []}
for candidate in candidates:
    tiers[candidate["质量分层"][0]].append(candidate)

output = {
    "input": str(CANDIDATES),
    "input_sha256": sha256(CANDIDATES),
    "all": summarize(candidates),
    "tiers": {tier: summarize(rows) for tier, rows in tiers.items()},
}
print(json.dumps(output, ensure_ascii=False, indent=2))
