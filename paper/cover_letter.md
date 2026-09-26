# Cover letter draft

Dear Editors,

We submit the manuscript "TAG-KG: Auditable Rule-Evidence Reranking for Chinese Temporal-Function Diagnosis" for consideration as a research article in *Natural Language Processing*.

The manuscript addresses a practical gap between temporal-expression detection and grammatical-function diagnosis in Chinese language education. The same surface form can be an event adverbial, a nominal modifier, a duration complement, or another temporal use. TAG-KG combines a lightweight local classifier with a frozen, label-conditioned rule-evidence scorer and a candidate-centric knowledge graph that stores annotation, cue, rule, cleaning, and source links. The article evaluates the predictive score, the graph's structural traceability, and a selective teacher-review policy as separate claims.

The journal version provides a substantially expanded treatment of the task and evidence protocol. It separates a 477-record Primary collection from a 500-record Full collection while retaining every original record; reports registered span recall, conditional diagnosis, and end-to-end labeled recall as distinct estimands; adds locked Full-test robustness, grouped stability, risk-coverage routing, and a repeated LLM explanation audit; and links each headline number to a versioned artifact and executable check. On the fixed Primary test, the flat rule/cue adapter improves labeled recall from .750 to .844 and macro labeled recall from .365 to .701. The paired macro-recall gain is .336 with a 95% group-bootstrap interval of [.217, .446]. At 70% automatic coverage, the locked routing policy retains .030 joint risk while sending 29 of 96 registered keys to review. The manuscript states the limits of these results: they are internally held-out, candidate-conditioned, source-specific, and not evidence of open-span generalization or measured teacher time savings.

The earlier CAIT 2026 submission (Paper CT3001) was withdrawn at the authors' request before registration and publication and was not included in the proceedings, as documented by the withdrawal letter retained in our submission records. It is not under consideration elsewhere. The present article is a substantially expanded journal treatment with a revised evidence contract, a recovered and independently rebuilt graph audit, locked robustness evaluation, selective risk-coverage analysis, repeated explanation audit, and claim-evidence ledger. The withdrawal letter can be supplied to the editor on request.

The authors declare no competing interests. This work was supported by the National College Students' Innovation and Entrepreneurship Training Program (No. 202610032033) and the Hainan Provincial College Students' Innovation Training Program. The rights-cleared Authority500-Full sentence records, a de-identified adjudication table, the verified candidate-centric graph export, audit tables, and current paper evidence are publicly released with the schema, rule table, and split identifiers at https://github.com/yyting2006-ai/tag-kg-authority500-reproducibility. Annotator identities, free-text comments, source scans, and private working files are excluded.

Thank you for considering this manuscript.

Sincerely,  
Tingrui You, Na Zhang, Ling Xiong, and Jaimei Li  
Hainan International College and School of Information Science, Beijing Language and Culture University  
Beijing, China  
Corresponding author: Ljm@blcu.edu.cn
