#!/usr/bin/env python3
"""Regenerate the Flutter Web favicon and PWA icons from the VDP logo.

Flutter's `flutter create` scaffold ships a blue Flutter placeholder for
`web/favicon.png` and `web/icons/*`. `flutter_launcher_icons.yaml` only
generates Android/iOS/Windows icons, so the web set is produced here from the
same source artwork (`assets/images/vdp_logo.png`).

Usage (requires Pillow):
    python3 tool/generate_web_icons.py

Outputs:
    web/favicon.png                 32x32, circular, transparent corners
    web/icons/Icon-192.png          192x192, circular, transparent corners
    web/icons/Icon-512.png          512x512, circular, transparent corners
    web/icons/Icon-maskable-192.png 192x192, full-bleed, logo inside 80% safe zone
    web/icons/Icon-maskable-512.png 512x512, full-bleed, logo inside 80% safe zone
"""

from __future__ import annotations

from pathlib import Path

from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "assets" / "images" / "vdp_logo.png"
WEB = ROOT / "web"

# Measured from the 1024x1024 source: the navy outer ring spans x 84..938 and
# y 76..928. A couple of pixels of margin keeps anti-aliasing intact.
CIRCLE_BOX = (82, 74, 941, 931)
# Cream background of the source artwork; used as the maskable fill colour.
BACKGROUND = (251, 251, 244, 255)

# Supersampling factor for a smooth circular alpha edge.
SUPERSAMPLE = 4


def _circle_crop(source: Image.Image) -> Image.Image:
    left, top, right, bottom = CIRCLE_BOX
    side = max(right - left, bottom - top)
    cx, cy = (left + right) / 2, (top + bottom) / 2
    box = (
        round(cx - side / 2),
        round(cy - side / 2),
        round(cx + side / 2),
        round(cy + side / 2),
    )
    cropped = source.crop(box).convert("RGBA")

    big = cropped.size[0] * SUPERSAMPLE
    mask = Image.new("L", (big, big), 0)
    ImageDraw.Draw(mask).ellipse((0, 0, big - 1, big - 1), fill=255)
    mask = mask.resize(cropped.size, Image.LANCZOS)
    cropped.putalpha(mask)
    return cropped


def _round_icon(circle: Image.Image, size: int) -> Image.Image:
    return circle.resize((size, size), Image.LANCZOS)


def _maskable_icon(circle: Image.Image, size: int) -> Image.Image:
    # PWA maskable icons may be clipped to a circle of 80% diameter; keep the
    # whole logo inside that safe zone.
    canvas = Image.new("RGBA", (size, size), BACKGROUND)
    inner = round(size * 0.78)
    logo = circle.resize((inner, inner), Image.LANCZOS)
    offset = ((size - inner) // 2, (size - inner) // 2)
    canvas.alpha_composite(logo, offset)
    return canvas.convert("RGB")


def main() -> int:
    source = Image.open(SOURCE)
    circle = _circle_crop(source)

    outputs = {
        WEB / "favicon.png": _round_icon(circle, 32),
        WEB / "icons" / "Icon-192.png": _round_icon(circle, 192),
        WEB / "icons" / "Icon-512.png": _round_icon(circle, 512),
        WEB / "icons" / "Icon-maskable-192.png": _maskable_icon(circle, 192),
        WEB / "icons" / "Icon-maskable-512.png": _maskable_icon(circle, 512),
    }
    for path, image in outputs.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        image.save(path, optimize=True)
        print(f"wrote {path.relative_to(ROOT)} {image.size[0]}x{image.size[1]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
