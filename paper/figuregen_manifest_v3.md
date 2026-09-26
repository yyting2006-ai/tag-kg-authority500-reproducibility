# ImageGen figure manifest v3

The requested regeneration was completed with the built-in ImageGen tool. The
new bases are stored in the project and were inspected before use as visual
references for the publication redraw.

## Regenerated bases

- `figures/fig3_imagegen_base_v3.png` — selective-prediction layout: descending
  risk-coverage curve plus automatic/review queue bars. SHA-256:
  `15CFE0CEDC41DFC33D730CD859A6DC6D42A147BEE677950B90003E2300585870`.
- `figures/fig4_imagegen_base_v3.png` — four-panel performance layout with
  generous title plates, large bars, and clear gridlines. SHA-256:
  `747F2277E3F63A5A6145424E171810A66FB0C70D9673CD5AC829254C42CF8CA3`.

The final manuscript continues to use the matching SVG/PDF redraws for the
data-bearing figures. Exact axis labels, values, captions, and equations are
therefore typeset from source rather than read from generated pixels. The
ImageGen bases remain available as the documented visual-generation inputs.

## Layout correction

All five figure environments in `main.tex` now call `\sidecapoff` from the
official `CUP-JNL-NLP.cls`. This selects the class's bottom-caption path and
prevents wide figures from receiving side-caption treatment. The rebuilt PDF
was rendered and checked on pages 15 and 17; the captions are below the figure
boxes with visible white separation.
