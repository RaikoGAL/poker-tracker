"""Build the website from the shared app source.

src/app.html is written in Claude-artifact format (page content only: <title>, <style>, markup, scripts).
The same file is published as the in-Claude artifact. This script wraps it into a full HTML document
for GitHub Pages: head tags (title, styles, fonts) move into <head>, PWA tags are added.

    python3 build.py
"""
import re, pathlib

root = pathlib.Path(__file__).parent
src = (root / "src" / "app.html").read_text(encoding="utf-8")

body_start = src.index('<div class="wrap">')
head_part, body_part = src[:body_start], src[body_start:]
head_part = re.sub(r'<meta name="claude:viewport-fit-sides"[^>]*>\s*', "", head_part)

page = f"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="color-scheme" content="dark light">
<meta name="theme-color" content="#0e1411">
<meta name="description" content="Bankroll discipline, sessions and hand reviews for online cash games.">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="Poker">
<link rel="manifest" href="manifest.webmanifest">
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32.png">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<style>:root{{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}}body{{margin:0}}img{{max-width:100%}}[hidden]{{display:none!important}}</style>
{head_part.strip()}
</head>
<body>
{body_part.strip()}
</body>
</html>
"""
(root / "index.html").write_text(page, encoding="utf-8")
print(f"index.html written ({len(page):,} bytes)")
