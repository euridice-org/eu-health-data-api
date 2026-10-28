The editable Mermaid sequence diagram is `cross-border-ncp.mmd`.

Render with Mermaid CLI using the default theme and transparent background, then constrain the two exchange highlights:

    mmdc -i diagrams/cross-border-ncp.mmd -o /tmp/cross-border-raw.svg -b transparent -t default
    python3 diagrams/frame-cross-border-ncp.py /tmp/cross-border-raw.svg input/images/cross-border-ncp.svg

The postprocessor keeps each highlight within its EHR-facing participant pair. The left highlight spans the query and its eventual response; the right spans its adjacent query and response. Participant headers remain outside the frames. The page embeds the generated SVG.
