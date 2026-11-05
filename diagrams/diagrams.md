Some diagrams (ex: those in actors.md) are generated with [excalidraw](https://excalidraw.com/).

If someone else wants to make edits to these diagrams, the editable excalidraw file is in this directory.

## Authorization and actor-grouping figures

The published document and resource actor-grouping figures use
[docExchange_2.plantuml](../input/images-source/docExchange_2.plantuml) and
[resExchange_2.plantuml](../input/images-source/resExchange_2.plantuml). Render them locally with
PlantUML `-tsvg -o ../images` from `input/images-source`; the outputs are
`input/images/docExchange_2.svg` and `input/images/resExchange_2.svg`.
The `.mmd` files are equivalent alternative views, not the published SVG source.
The earlier `.drawio.svg` and PNG exports are retained as legacy artwork, with their editable
metadata unchanged; they are no longer included by the actor-grouping page.

The authentication sequence uses
[authorization-eidas-sequence.plantuml](../input/images-source/authorization-eidas-sequence.plantuml).
Render it with PlantUML `-tsvg -o ../includes` from `input/images-source` so the page includes the
updated `input/includes/authorization-eidas-sequence.svg`.