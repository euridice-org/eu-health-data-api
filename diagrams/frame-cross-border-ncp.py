#!/usr/bin/env python3
"""Constrain Mermaid highlights to the EHR-facing exchange spans."""

import argparse
from pathlib import Path
import xml.etree.ElementTree as ET


def frame_exchanges(source: Path, target: Path) -> None:
    tree = ET.parse(source)
    root = tree.getroot()
    namespace = "http://www.w3.org/2000/svg"
    ET.register_namespace("", namespace)
    frames = [node for node in root.iter() if node.get("class") == "rect"]
    labels = [node for node in root.iter() if node.get("class") == "note"]
    if len(frames) != 2 or len(labels) != 2:
        raise ValueError("Expected two exchange highlights and two This IG notes")

    # Mermaid expands an outer rect across every intervening message. Keep its
    # vertical span, but restrict its horizontal span to its EHR-facing pair.
    # Note geometry follows the participant positions, avoiding fixed pixels.
    for frame, label in zip(frames, labels):
        frame.set("x", str(float(label.attrib["x"]) - 10))
        frame.set("width", str(float(label.attrib["width"]) + 20))
        frame.set("stroke", "#222")
        frame.set("stroke-width", "2")
    tree.write(target, encoding="utf-8", xml_declaration=False)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("target", type=Path)
    args = parser.parse_args()
    frame_exchanges(args.source, args.target)
