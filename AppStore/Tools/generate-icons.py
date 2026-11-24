from pathlib import Path
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
ASSETS = ROOT / "Assets"
RIBBON = ROOT / "Ribbon" / "ObjectRenamer"
PROJECT = ROOT.parent / "Object Renamer"


def render(size: int) -> Image.Image:
    scale = 4
    pixels = size * scale
    image = Image.new("RGBA", (pixels, pixels), (0, 0, 0, 0))
    draw = ImageDraw.Draw(image)
    margin = round(pixels * 0.11)
    radius = round(pixels * 0.15)
    draw.rounded_rectangle(
        (margin, margin, pixels - margin, pixels - margin),
        radius=radius,
        fill="#4ba9e6",
    )

    # Autodesk Marketplace icons cannot contain text unless it is a registered
    # brand mark. Use the rename action itself as the complete icon graphic.
    width = max(3, round(pixels * 0.082))
    white = "#ffffff"
    navy = "#31556f"
    draw.line((pixels * 0.22, pixels * 0.39, pixels * 0.78, pixels * 0.39), fill=white, width=width)
    draw.line((pixels * 0.78, pixels * 0.39, pixels * 0.66, pixels * 0.27), fill=white, width=width)
    draw.line((pixels * 0.78, pixels * 0.39, pixels * 0.66, pixels * 0.51), fill=white, width=width)
    draw.line((pixels * 0.78, pixels * 0.64, pixels * 0.22, pixels * 0.64), fill=navy, width=width)
    draw.line((pixels * 0.22, pixels * 0.64, pixels * 0.34, pixels * 0.52), fill=navy, width=width)
    draw.line((pixels * 0.22, pixels * 0.64, pixels * 0.34, pixels * 0.76), fill=navy, width=width)
    return image.resize((size, size), Image.Resampling.LANCZOS)


def render_ribbon(size: int) -> Image.Image:
    source = render(256)
    bounds = source.getchannel("A").getbbox()
    artwork = source.crop(bounds)
    maximum = size - 2
    ratio = min(maximum / artwork.width, maximum / artwork.height)
    width = max(1, round(artwork.width * ratio))
    height = max(1, round(artwork.height * ratio))
    artwork = artwork.resize((width, height), Image.Resampling.LANCZOS)
    canvas = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    canvas.alpha_composite(artwork, ((size - width) // 2, (size - height) // 2))
    return canvas


ASSETS.mkdir(parents=True, exist_ok=True)
RIBBON.mkdir(parents=True, exist_ok=True)
for size in (1024, 120, 100):
    render(size).save(ASSETS / f"ObjectRenamerIcon-{size}.png")
render_ribbon(32).save(RIBBON / "ObjectRenamer32.png")
render_ribbon(16).save(RIBBON / "ObjectRenamer16.png")

icon = render(256)
for target in (ASSETS / "ObjectRenamerIcon.ico", PROJECT / "ObjectRenamerIcon.ico"):
    icon.save(
        target,
        format="ICO",
        sizes=[(16, 16), (24, 24), (32, 32), (48, 48), (64, 64), (128, 128), (256, 256)],
    )
